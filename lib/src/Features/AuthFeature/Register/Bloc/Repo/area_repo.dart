import 'package:dio/dio.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Model/area_model.dart';
import 'package:querium/src/core/constants/api_key.dart';
import 'package:querium/src/core/services/Network/api_result.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/Network/network_services.dart';
import 'package:querium/src/core/services/services_locator.dart';

class AreaRepository with ApiKey {
  final NetworkService _networkService = sl<NetworkService>();

  Future<ApiResult<List<AreaModel>>> getArea({
    required int pageNum,
    required int cityId,
  }) async {
    try {
      Response response = await _networkService.get(
        url: uRLDistricts,
        queryParams: {
          'city_id': cityId,
        },
      );
      return ApiResult.success(List.from(response.data['data'])
          .map((e) => AreaModel.fromJson(e))
          .toList());
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
