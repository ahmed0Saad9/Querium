import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/SplachAndOnbordingFeature/bloc/controlelr/choose_language_controller.dart';
import 'package:querium/src/Features/SplachAndOnbordingFeature/bloc/controlelr/splach_controller.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/utils/extensions.dart';

import 'choose_language_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (splashController) => Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/Gradiant.png',
              ),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: AnimatedOpacity(
                          opacity: splashController.isWidgetVisible ? 1.0 : 0.0,
                          duration: const Duration(seconds: 2),
                          child: Container(
                            height: 235.h,
                            width: 1.w,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          24.ESH(),
                          AnimatedOpacity(
                            opacity:
                                splashController.isWidgetVisible ? 1.0 : 0.0,
                            duration: const Duration(seconds: 2),
                            child: AnimatedAlign(
                              alignment: splashController.alignmentMETLogo,
                              duration: const Duration(seconds: 1),
                              child: AnimatedContainer(
                                curve: Curves.easeInOut,
                                duration: const Duration(seconds: 1),
                                width: 177.w,
                                height: 153.h,
                                child: Image.asset(
                                  'assets/images/METLogo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      AnimatedAlign(
                        alignment: splashController.alignmentLogo,
                        duration: const Duration(seconds: 1),
                        child: AnimatedContainer(
                          curve: Curves.easeInOut,
                          duration: const Duration(seconds: 1),
                          width: splashController.width.w,
                          height: splashController.height.h,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GetBuilder<ChooseLanguageController>(
              init: ChooseLanguageController(),
              builder: (chooseLanguageController) => AnimatedPositioned(
                duration: const Duration(seconds: 2),
                bottom: chooseLanguageController.position,
                child: LanguageSelect(
                  controller: chooseLanguageController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
