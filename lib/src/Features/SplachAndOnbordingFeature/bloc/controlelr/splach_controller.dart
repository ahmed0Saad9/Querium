import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/SplachAndOnbordingFeature/ui/choose_language_screen.dart';
import 'package:querium/src/Features/SplachAndOnbordingFeature/ui/onbording_screen.dart';

class SplashController extends GetxController {
  Timer? _animationTimer;
  Timer? _visibleTimer;
  Timer? _splashTimer;
  @override
  void onInit() async {
    super.onInit();
    _animationTimer = Timer(const Duration(seconds: 2), () {
      triggerAnimation();
    });
    _visibleTimer = Timer(const Duration(seconds: 3), () {
      toggleVisibility();
    });
    _splashTimer = Timer(const Duration(seconds: 5555), () async {
      moveToChooseLanguage();
    });
  }

  var width = 250.0;
  var height = 300.0;
  var alignmentLogo = Alignment.center;

  void triggerAnimation() {
    width = 150;
    height = 200;
    alignmentLogo = Alignment.centerLeft;
    update();
  }

  bool isWidgetVisible = false;
  var alignmentMETLogo = Alignment.centerRight;

  void toggleVisibility() {
    isWidgetVisible = !isWidgetVisible;

    update();
  }

  void moveToChooseLanguage() {
    Get.offAll(() => const ChooseLanguageScreen(),
        transition: Transition.fadeIn, duration: const Duration(seconds: 2));
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationTimer?.cancel();
    _visibleTimer?.cancel();
    _splashTimer?.cancel();
  }
}
