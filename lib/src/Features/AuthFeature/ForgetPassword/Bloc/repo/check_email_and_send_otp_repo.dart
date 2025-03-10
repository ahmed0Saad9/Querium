import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:querium/src/core/constants/api_key.dart';
import 'package:querium/src/core/services/Network/api_result.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/Network/network_services.dart';

class CheckEmailAndSendOtpRepo with ApiKey {
  final NetworkService _networkService = Get.find();

  Future<ApiResult<Response>> checkEmailAndSendOtp(
      {required String email}) async {
    try {
      final response = await _networkService.post(
        // url: uRLCheckEmailAndSendOtp,
        body: {
          "email": email,
        },
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
