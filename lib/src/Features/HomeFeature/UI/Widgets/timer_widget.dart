import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/controller/quiz_controller.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/utils/extensions.dart';

class TimerWidget extends StatelessWidget {
  final QuizController controller;
  const TimerWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomTextL(
              '10:00',
              fontSize: 16.sp,
              fontWeight: FW.medium,
            ),
            const Spacer(),
            CustomTextL(
              controller.time,
              fontSize: 16.sp,
              fontWeight: FW.medium,
            )
          ],
        ),
        8.ESH(),
        Container(
          width: Get.width,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              boxShadow: AppColors.linearTimerBackgroundShadow,
              color: AppColors.linearTimerBG,
              borderRadius: BorderRadius.circular(27.r)),
          child: const LinearTimer(
            backgroundColor: Colors.transparent,
            forward: true,
            minHeight: 7,
            color: AppColors.linearTimer,
            duration: Duration(
              // minutes: 10,
              seconds: 10,
            ),
          ),
        ),
      ],
    );
  }
}
