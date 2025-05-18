import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/Repo/get_questions_repo.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/model/question_model.dart';
import 'package:querium/src/Features/QuizFeature/UI/screens/results_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/services/Base/base_controller.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/services_locator.dart';

class QuizController extends BaseController<GetQuestionsRepository> {
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

    var result = await repository!.getQuestions();

    result.when(success: (List<Questions> q) {
      _questionsList.addAll(q);
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
    startTimer(600);
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
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        // Get.off(const ResultsScreen());
        showNotification();
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = remainingSeconds % 60;
        time = minutes.toString().padLeft(2, "0") +
            ":" +
            seconds.toString().padLeft(2, "0");
        remainingSeconds--;
        update();
      }
    });
  }

  void showNotification() {
    // Show a SnackBar using GetX
    Get.snackbar(
      "Time is up", // Title
      "This will effect your results", // Message
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      mainButton: TextButton(
        onPressed: () {
          Get.back(); // Dismiss the SnackBar
        },
        child: const CustomTextL("Dismiss", color: AppColors.main),
      ),
    );
  }

  int answerIdSelected = -1;

  void selectTapId(int id) {
    answerIdSelected = id;
    update();
  }

  bool isLastQuestion = false;

  int index = 0;

  void nextQuestion() {
    if (index == 39) {
      isLastQuestion = true;
    } else {
      isLastQuestion = false;
      index++;
    }
    update();
  }

  void previousQuestion() {
    if (index > 0) {
      index--;
    }
    update();
  }

  // String? getAnswer(int index) {
  //   return;
  // }
}
