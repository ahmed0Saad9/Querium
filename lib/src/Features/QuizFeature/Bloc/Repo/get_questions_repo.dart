import 'package:dio/dio.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/model/question_model.dart';
import 'package:querium/src/core/constants/api_key.dart';
import 'package:querium/src/core/services/Network/api_result.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/Network/network_services.dart';
import 'package:querium/src/core/services/services_locator.dart';

class GetQuestionsRepository with ApiKey {
  final NetworkService _networkService = sl<NetworkService>();

  Future<ApiResult<List<Questions>>> getQuestions() async {
    try {
      Response response = await _networkService.get(
        url: uRLGetQuestions,
      );
      return ApiResult.success(List.from(response.data['questions'])
          .map((e) => Questions.fromJson(e))
          .toList());
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
