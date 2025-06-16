import 'package:dio/dio.dart';
import 'package:querium/src/Features/AccountFeature/Bloc/params/reset_password_params.dart';
import 'package:querium/src/core/constants/api_key.dart';
import 'package:querium/src/core/services/Network/api_result.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/Network/network_services.dart';
import 'package:querium/src/core/services/services_locator.dart';

class ResetPasswordRepository with ApiKey {
  final NetworkService _networkService = sl<NetworkService>();

  Future<ApiResult<Response>> postResetPassword(
      {required ResetPasswordParams resetPasswordParams}) async {
    try {
      Response response = await _networkService.post(
          url: uRLResetPassword, auth: true, body: resetPasswordParams.toMap());
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
