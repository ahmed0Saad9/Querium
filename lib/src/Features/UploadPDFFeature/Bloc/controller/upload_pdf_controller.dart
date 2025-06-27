import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:querium/src/Features/AuthFeature/EditGeneralProfile/Bloc/Controller/edit_general_profile_controller.dart';
import 'package:querium/src/Features/UploadPDFFeature/Bloc/Param/upload_pdf_param.dart';
import 'package:querium/src/Features/UploadPDFFeature/Bloc/Repo/upload_file_repo.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/dialog_done.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/dialog_fail.dart';
import 'package:querium/src/core/services/Base/base_controller.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/services_locator.dart';

class UploadPDFController extends BaseController<UploadFileRepository> {
  // Constants
  static const List<String> allowedExtensions = ['pdf'];
  static const double bytesToKb = 1024;

  // State variables
  String? fileName;
  MediaType? userFile;
  String? fileExtension;
  double? fileSize;

  // Keys
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  UploadFileRepository get repository => sl<UploadFileRepository>();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> storeFileUploaded() async {
    if (userFile == null) return;

    showEasyLoading();

    final result = await repository.storeFileUploaded(
      param: UploadParams(
        studentId: sl<GetStorage>().read('studentID'),
        file: userFile!,
      ),
    );

    closeEasyLoading();

    result.when(
      success: (Response response) {
        clearFile();
        Get.dialog(const DialogDone());
      },
      failure: (NetworkExceptions error) {
        Get.dialog(const DialogFail());
        actionNetworkExceptions(error);
      },
    );
  }

  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
      );

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;
        final convertedFile = await platformFileToFile(file);

        userFile = MediaType(
          media: convertedFile,
          type: file.extension ?? 'pdf',
        );
        fileName = file.name;
        fileExtension = file.extension;
        fileSize = file.size / bytesToKb;
        update();
      }
    } catch (e) {
      Get.dialog(const DialogFail());
      debugPrint('File picking error: $e');
    }
  }

  Future<File> platformFileToFile(PlatformFile platformFile) async {
    if (platformFile.path != null) {
      return File(platformFile.path!);
    }

    if (platformFile.bytes != null) {
      final tempFile =
          File('${Directory.systemTemp.path}/${platformFile.name}');
      await tempFile.writeAsBytes(platformFile.bytes!);
      return tempFile;
    }

    throw Exception('No valid file data available');
  }

  void clearFile() {
    fileName = null;
    userFile = null;
    fileExtension = null;
    fileSize = null;
    update();
  }
}
