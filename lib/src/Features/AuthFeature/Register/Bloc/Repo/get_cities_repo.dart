import 'package:dio/dio.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Model/nationality_model.dart';
import 'package:querium/src/core/constants/api_key.dart';
import 'package:querium/src/core/services/Network/api_result.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/Network/network_services.dart';
import 'package:querium/src/core/services/services_locator.dart';

class GetCountriesRepository with ApiKey {
  final NetworkService _networkService = sl<NetworkService>();

  Future<ApiResult<List<CountryModel>>> getCities(
      {required int pageNum, String? keySearch}) async {
    try {
      Response response = await _networkService.get(
        url: uRLCities,
        queryParams: {
          if (keySearch != null && keySearch.isNotEmpty) 'search': keySearch,
        },
      );
      return ApiResult.success(List.from(response.data['data'])
          .map((e) => CountryModel.fromMap(e))
          .toList());
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
