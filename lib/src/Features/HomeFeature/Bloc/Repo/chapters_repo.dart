import 'package:dio/dio.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/model/chapters_model.dart';
import 'package:querium/src/core/constants/api_key.dart';
import 'package:querium/src/core/services/Network/api_result.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/Network/network_services.dart';
import 'package:querium/src/core/services/services_locator.dart';

class ChaptersRepository with ApiKey {
  final NetworkService _networkService = sl<NetworkService>();

  Future<ApiResult<List<Chapters>>> getChapters(
      {required int subjectID}) async {
    try {
      Response response = await _networkService.get(
        url: uRLGetChapters(subjectID: subjectID),
      );
      return ApiResult.success(
          List.from(response.data).map((e) => Chapters.fromJson(e)).toList());
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
