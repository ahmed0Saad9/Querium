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
  String? fileName;
  MediaType? userFile;
  String? fileExtension;
  double? fileSize;

  @override
// TODO: implement repository
  get repository => sl<UploadFileRepository>();

  @override
  void onInit() {
// TODO: implement onInit
    super.onInit();
  }

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  Future<void> storeFileUploaded() async {
    showEasyLoading();
    var result = await repository!.storeFileUploaded(
      param: UploadParams(
        studentId: sl<GetStorage>().read('studentID'),
        file: userFile!,
      ),
    );
    closeEasyLoading();
    result.when(success: (Response response) {
      clearFile();
      Get.dialog(const DialogDone());
    }, failure: (NetworkExceptions error) {
      Get.dialog(const DialogFail());
      actionNetworkExceptions(error);
    });
  }

  // Function to pick an image file
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      userFile = MediaType(
          media: await platformFileToFile(file), type: file.extension!);
      fileName = file.name;
      fileExtension = file.extension;
      fileSize = file.size / 1024; // Extract the file size in bytes
      update();
    }
  }

  Future<File> platformFileToFile(PlatformFile platformFile) async {
    if (platformFile.path == null) {
      // For web or when path is not available, create a temporary file
      final file = File('${Directory.systemTemp.path}/${platformFile.name}');
      await file.writeAsBytes(platformFile.bytes!);
      return file;
    }
    return File(platformFile.path!);
  }

  // Function to clear the selected file
  void clearFile() {
    fileName = null;
    fileExtension = null;
    fileSize = null;

    update();
  }
}
