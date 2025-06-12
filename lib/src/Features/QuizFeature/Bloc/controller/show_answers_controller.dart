import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/model/question_result.dart';
import 'package:querium/src/core/constants/color_constants.dart';

class ShowAnswersController extends GetxController {
  final List<ShowAnswersModel> answersListCards = [];
  List<QuestionResult> questionResults = []; // Add this line

  @override
  void onInit() {
    super.onInit();
    _loadResults();
  }

  void _loadResults() {
    // Get results passed from QuizScreen
    final dynamic args = Get.arguments;

    if (args is List<QuestionResult>) {
      questionResults = args;
      _processResults();
    } else {
      // Handle case where no results are passed
      debugPrint('No question results received');
    }
  }

  void _processResults() {
    answersListCards.clear();

    for (int i = 0; i < questionResults.length; i++) {
      final result = questionResults[i];
      answersListCards.add(
        ShowAnswersModel(
          questionNumber: i + 1,
          questionStatus: _determineStatusColor(result),
          isCorrect: result.isCorrect,
          isAnswered: result.isAnswered,
        ),
      );
    }
    update();
  }

  Color _determineStatusColor(QuestionResult result) {
    if (!result.isAnswered) return AppColors.notAnswered;
    return result.isCorrect
        ? AppColors.correctAnswer
        : AppColors.incorrectAnswer;
  }
}

class ShowAnswersModel {
  final int questionNumber;
  final Color questionStatus;
  final bool isCorrect;
  final bool isAnswered;

  ShowAnswersModel({
    required this.questionNumber,
    required this.questionStatus,
    required this.isCorrect,
    required this.isAnswered,
  });
}
