import 'package:dio/dio.dart';
import 'package:querium/src/Features/UploadPDFFeature/Bloc/Param/upload_pdf_param.dart';
import 'package:querium/src/core/constants/api_key.dart';
import 'package:querium/src/core/services/Network/api_result.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/Network/network_services.dart';
import 'package:querium/src/core/services/services_locator.dart';

class UploadFileRepository with ApiKey {
  final NetworkService _networkService = sl<NetworkService>();

  Future<ApiResult<Response>> storeFileUploaded(
      {required UploadParams param}) async {
    try {
      Response response = await _networkService.post(
        url: uRLUploadPdf,
        auth: true,
        bodyFormData: await param.toFormData(),
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
