import 'package:dio/dio.dart';
import 'package:querium/src/Features/AccountFeature/Bloc/Model/account_details_model.dart';
import 'package:querium/src/Features/AccountFeature/Bloc/params/profile_params.dart';
import 'package:querium/src/core/constants/api_key.dart';
import 'package:querium/src/core/services/Network/api_result.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/Network/network_services.dart';
import 'package:querium/src/core/services/services_locator.dart';

class ProfileRepo with ApiKey {
  final NetworkService _networkService = sl<NetworkService>();

  Future<ApiResult<Response>> getUserData({
    required int universityIDCard,
  }) async {
    try {
      Response response = await _networkService.get(
        url: uRLProfile(universityIDCard: universityIDCard),
        auth: true,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
