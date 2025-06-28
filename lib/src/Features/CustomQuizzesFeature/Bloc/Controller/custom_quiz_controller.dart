import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:querium/src/Features/CustomQuizzesFeature/Bloc/Model/custom_quiz_model.dart';
import 'package:querium/src/Features/CustomQuizzesFeature/Bloc/Repo/custom_quiz_repo.dart';
import 'package:querium/src/Features/CustomQuizzesFeature/UI/screens/custom_results_screen.dart';
import 'package:querium/src/Features/CustomQuizzesFeature/UI/screens/custom_show_answers_screen.dart';

import 'package:querium/src/Features/QuizFeature/Bloc/model/question_result.dart';

import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/services/Base/base_controller.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/services_locator.dart';

class CustomQuizController
    extends BaseController<GetCustomQuestionsRepository> {
  int fileId;

  CustomQuizController({
    required this.fileId,
  });

  @override
  // TODO: implement repository
  get repository => sl<GetCustomQuestionsRepository>();

  @override
  void onInit() async {
    // TODO: implement onInit
    await getCustomQuestions();

    super.onInit();
  }

  final List<CustomQuizQuestions> _questionsList = [];

  List<CustomQuizQuestions> get questionsList => _questionsList;

  Future<void> getCustomQuestions() async {
    _questionsList.clear();
    showLoading();
    reInitPagination();
    update();

    var result = await repository!.getCustomQuestions(
      studentId: sl<GetStorage>().read('studentID'),
      fileId: fileId,
    );

    result.when(success: (List<CustomQuizQuestions> q) {
      _questionsList.addAll(q);
      _initializeQuestionResults(q);
      doneLoading();
      update();
    }, failure: (NetworkExceptions error) {
      errorLoading();
      status = actionNetworkExceptions(error);
      update();
    });
  }

  // String getAnswers(List<String> answers) {
  //   for (int i = 0; i < answers.length; i++) {
  //     answers[i];
  //   }
  // }

  Timer? _timer;
  int remainingSeconds = 1;
  String time = '10:00';

  @override
  void onReady() {
    // TODO: implement onReady
    // startTimer(600);
    // startTimer(1);
    super.onReady();
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  void startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    // stopTimer();
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        _showTimeUpSnackbar();
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = remainingSeconds % 60;
        time =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainingSeconds--;
        update();
      }
    });
  }

  void _showTimeUpSnackbar() {
    Get.snackbar(
      'Time Up!',
      'Your quiz time has expired.',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  int correctQuestions = 0;
  int answerIdSelected = -1;
  int index = 0;
  bool isLastQuestion = false;

  void selectTapId(int id) {
    answerIdSelected = id;
    update();
  }

  List<QuestionResult> questionResults = [];
  int get percentageScore {
    if (questionsList.isEmpty) return 0;
    return ((correctQuestions / questionsList.length) * 100).round();
  }

  void _initializeQuestionResults(List<CustomQuizQuestions> questions) {
    questionResults = questions.asMap().entries.map((entry) {
      return QuestionResult(
        questionNumber: entry.key + 1, // 1-based index
        isCorrect: false,
        isAnswered: false,
      );
    }).toList();
  }

  void validateAnswer() {
    if (answerIdSelected != -1) {
      final currentQuestion = questionsList[index];
      bool isCorrect = currentQuestion.answers[answerIdSelected] ==
          currentQuestion.questionCorrectAnswer;

      // Update results with the selected answer
      questionResults[index] = QuestionResult(
        questionNumber: index + 1,
        isCorrect: isCorrect,
        isAnswered: true,
        selectedAnswerIndex: answerIdSelected,
        selectedAnswer: currentQuestion.answers[answerIdSelected],
      );

      if (isCorrect) correctQuestions++;

      // Move to next question or end quiz
      if (index < questionsList.length - 1) {
        isLastQuestion = false;
        index++;
        answerIdSelected = -1; // Reset selected answer
      } else {
        // Quiz completed
        showFinalResults();
      }
      update();
    }
  }

  void previousQuestion() {
    if (index > 0) {
      // Check if current question was answered before moving back
      if (answerIdSelected != -1) {
        final currentQuestion = questionsList[index];
        bool isCorrect = currentQuestion.answers[answerIdSelected] ==
            currentQuestion.questionCorrectAnswer;

        // If answer was correct, decrement correctAnswers count
        if (isCorrect) {
          correctQuestions--;
        }

        // Reset the question result for current question
        questionResults[index] = QuestionResult(
          questionNumber: index + 1,
          isCorrect: false,
          isAnswered: false,
          selectedAnswerIndex: null,
          selectedAnswer: null,
        );
      }

      // Move to previous question
      index--;

      // Set the selected answer for the previous question if it was answered
      answerIdSelected = questionResults[index].selectedAnswerIndex ?? -1;

      update();
    }
  }

  void showAnswersResults(int fileId) {
    debugPrint('Current results: $questionResults');
    // Make sure we have results to pass
    if (questionResults.isEmpty && questionsList.isNotEmpty) {
      questionResults = questionsList.asMap().entries.map((entry) {
        return QuestionResult(
          questionNumber: entry.key + 1,
          isCorrect: false, // Default to false if not answered
          isAnswered: false,
        );
      }).toList();
    }

    Get.to(
      () => const CustomShowAnswersScreen(),
      arguments: questionResults, // Explicitly pass the results
    );
  }

  void showFinalResults() {
    Get.to(CustomResultsScreen(
      percentageScore: percentageScore,
      totalQuestions: questionsList.length,
      correctQuestions: correctQuestions,
    ));
  }

// String? getAnswer(int index) {
//   return;
// }
}
