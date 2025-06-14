import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;
import 'package:querium/src/Features/AuthFeature/EditGeneralProfile/Bloc/Controller/edit_general_profile_controller.dart';

class UploadParams {
  final int studentId;
  final MediaType file;

  const UploadParams({
    required this.studentId,
    required this.file,
  });

  Future<Map<String, dynamic>> toMap() async {
    return {
      'StudentId': studentId,
    };
  }

  Future<FormData> toFormData() async {
    FormData formMap = FormData.fromMap(await toMap());
    formMap.files.add(
      MapEntry(
        'File',
        await MultipartFile.fromFile(
          file.media.path,
          filename: path.basename(file.media.path),
        ),
      ),
    );
    return formMap;
  }
}
