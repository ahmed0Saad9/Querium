import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/Repo/get_questions_repo.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/model/question_model.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/model/question_result.dart';
import 'package:querium/src/Features/QuizFeature/UI/screens/quiz_screen.dart';
import 'package:querium/src/Features/QuizFeature/UI/screens/results_screen.dart';
import 'package:querium/src/Features/QuizFeature/UI/screens/showa_nswers_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/services/Base/base_controller.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/services_locator.dart';

class QuizController extends BaseController<GetQuestionsRepository> {
  int chapterID;
  String subjectName;
  Timer? _timer;
  int remainingSeconds = 1;
  String time = '10:00';
  int correctAnswers = 0;
  int answerIdSelected = -1;
  int index = 0;
  bool isLastQuestion = false;
  List<QuestionResult> questionResults = [];

  QuizController({
    required this.chapterID,
    required this.subjectName,
  });

  @override
  // TODO: implement repository
  get repository => sl<GetQuestionsRepository>();

  @override
  void onInit() async {
    // TODO: implement onInit
    await getQuestions();
    super.onInit();
  }

  final List<Questions> _questionsList = [];

  List<Questions> get questionsList => _questionsList;

  Future<void> getQuestions() async {
    _questionsList.clear();
    showLoading();
    reInitPagination();
    update();

    var result = await repository!.getQuestions(chaptersID: chapterID);

    result.when(success: (List<Questions> q) {
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

  @override
  void onClose() {
    _timer!.cancel();
    super.onClose();
  }

  void stopTimer() {
    _timer!.cancel();
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

  void selectTapId(int id) {
    answerIdSelected = id;
    update();
  }

  int get percentageScore {
    if (questionsList.isEmpty) return 0;
    return ((correctAnswers / questionsList.length) * 100).round();
  }

  void _initializeQuestionResults(List<Questions> questions) {
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
          currentQuestion.correctAnswer;

      // Update results with the selected answer
      questionResults[index] = QuestionResult(
        questionNumber: index + 1,
        isCorrect: isCorrect,
        isAnswered: true,
        selectedAnswerIndex: answerIdSelected,
        selectedAnswer: currentQuestion.answers[answerIdSelected],
      );
      if (isCorrect) correctAnswers++;

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
            currentQuestion.correctAnswer;

        // If answer was correct, decrement correctAnswers count
        if (isCorrect) {
          correctAnswers--;
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

  void showAnswersResults() {
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
    Get.off(
      const ShowAnswersScreen(),
      arguments: questionResults, // Explicitly pass the results
    );
    stopTimer();
  }

  void showFinalResults() {
    Get.off(ResultsScreen(
      percentageScore: percentageScore,
      correctAnswers: correctAnswers,
      totalQuestions: questionsList.length,
    ));
    stopTimer();
  }

  void startExam() {
    startTimer(10);
  }
}
