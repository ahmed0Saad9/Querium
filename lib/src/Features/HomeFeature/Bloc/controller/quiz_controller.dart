import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/model/answers_model.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';

class QuizController extends GetxController {
  Timer? _timer;
  int remainingSeconds = 1;
  String time = '00:00';
  @override
  void onReady() {
    // TODO: implement onReady
    // startTimer(600);
    startTimer(10);
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
        Get.back();
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
      "Be faster next time", // Message
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      mainButton: TextButton(
        onPressed: () {
          Get.back(); // Dismiss the SnackBar
        },
        child: const CustomTextL("Dismiss", color: AppColors.main),
      ),
    );
  }

  int answerIdSelected = 0;

  void selectTapId(int id) {
    answerIdSelected = id;
    update();
  }

  List<AnswersModel> answer = [
    const AnswersModel(id: 1, label: 'A)', answer: 'To be'),
    const AnswersModel(id: 2, label: 'B)', answer: 'Not to be'),
    const AnswersModel(id: 3, label: 'C)', answer: 'Who Cares'),
    const AnswersModel(id: 4, label: 'D)', answer: 'All answers are correct'),
  ];
}
