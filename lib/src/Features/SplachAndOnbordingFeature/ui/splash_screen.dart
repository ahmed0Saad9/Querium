import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/SplachAndOnbordingFeature/bloc/controlelr/splach_controller.dart';
import 'package:querium/src/core/constants/color_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) => Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(gradient: AppColors.gradientSplash),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
          ],
        ),
      ),
    );
  }
}
