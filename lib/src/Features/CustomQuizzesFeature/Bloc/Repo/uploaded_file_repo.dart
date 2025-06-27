import 'package:dio/dio.dart';
import 'package:querium/src/Features/CustomQuizzesFeature/Bloc/Model/uploaded_file_model.dart';
import 'package:querium/src/core/constants/api_key.dart';
import 'package:querium/src/core/services/Network/api_result.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/Network/network_services.dart';
import 'package:querium/src/core/services/services_locator.dart';

class GetUploadedFileRepository with ApiKey {
  final NetworkService _networkService = sl<NetworkService>();

  Future<ApiResult<List<UploadedFile>>> getUploadedFile(
      {required String status, required int studentID}) async {
    try {
      Response response = await _networkService.get(
        url: uRLUploadedPdfs(status: status, studentID: studentID),
      );
      return ApiResult.success(List.from(response.data)
          .map((e) => UploadedFile.fromJson(e))
          .toList());
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
