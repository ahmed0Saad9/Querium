import 'dart:async';
import 'package:get/get.dart';
import 'package:querium/src/Features/SplachAndOnbordingFeature/ui/choose_language_screen.dart';
import 'package:querium/src/Features/SplachAndOnbordingFeature/ui/onbording_screen.dart';

class SplashController extends GetxController {
  void moveToChooseLanguage() {
    Get.offAll(() => const ChooseLanguageScreen(),
        transition: Transition.fadeIn, duration: const Duration(seconds: 2));
  }

  @override
  void onInit() async {
    super.onInit();
    Timer(const Duration(seconds: 4), () async {
      moveToChooseLanguage();
    });
  }
}
