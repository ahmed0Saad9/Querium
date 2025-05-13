import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/controller/quiz_controller.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/utils/extensions.dart';

class QuestionCard extends StatelessWidget {
  final QuizController controller;

  const QuestionCard({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10.h),
          height: 155.h,
          width: Get.width,
          decoration: BoxDecoration(
              color: AppColors.backGroundWhite,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: AppColors.questionsCardShadow),
          child: Column(
            children: [
              CustomTextL(
                'Question ${controller.index + 1}',
                fontSize: 24.sp,
                fontWeight: FW.medium,
              ),
              30.ESH(),
              CustomTextR(
                // controller.questionsList[index].questions[index].questionText,
                controller.questionsList[controller.index].questionText,
                fontSize: 16.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
