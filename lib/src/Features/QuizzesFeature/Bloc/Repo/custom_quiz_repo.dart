import 'package:dio/dio.dart';
import 'package:querium/src/Features/QuizzesFeature/Bloc/Model/custom_quiz_model.dart';
import 'package:querium/src/core/constants/api_key.dart';
import 'package:querium/src/core/services/Network/api_result.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/Network/network_services.dart';
import 'package:querium/src/core/services/services_locator.dart';

class GetCustomQuestionsRepository with ApiKey {
  final NetworkService _networkService = sl<NetworkService>();

  Future<ApiResult<List<CustomQuizQuestions>>> getCustomQuestions(
      {required int studentId, required int fileId}) async {
    try {
      Response response = await _networkService.get(
        url: uRLGetCustomQuestions(fileId: fileId, studentId: studentId),
      );
      return ApiResult.success(List.from(response.data)
          .map((e) => CustomQuizQuestions.fromJson(e))
          .toList());
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
