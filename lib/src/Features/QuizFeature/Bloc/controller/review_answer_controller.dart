import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/controller/quiz_controller.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/model/question_model.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/model/question_result.dart';

class ReviewAnswerController extends GetxController {
  final QuizController quizController = Get.find<QuizController>();
  late int currentQuestionIndex;
  late List<QuestionResult> questionResults;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    currentQuestionIndex = args['questionIndex'];
    questionResults = args['results'];

    // Initialize without triggering rebuild during build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeQuestionView();
    });
  }

  void _initializeQuestionView() {
    quizController.index = currentQuestionIndex;
    quizController.answerIdSelected =
        questionResults[currentQuestionIndex].selectedAnswerIndex ?? -1;
    quizController.update(['question_card']); // Targeted update
  }

  void goToNextQuestion() {
    if (currentQuestionIndex < questionResults.length - 1) {
      currentQuestionIndex++;
      _updateQuestionView();
    }
  }

  void goToPreviousQuestion() {
    if (currentQuestionIndex > 0) {
      currentQuestionIndex--;
      _updateQuestionView();
    }
  }

  void _updateQuestionView() {
    quizController.index = currentQuestionIndex;
    quizController.answerIdSelected =
        questionResults[currentQuestionIndex].selectedAnswerIndex ?? -1;
    quizController.update(['question_card']); // Targeted update
    update(); // Update review controller
  }
}
