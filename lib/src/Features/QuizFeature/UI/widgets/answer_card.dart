import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/controller/quiz_controller.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/model/question_model.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';

class AnswerCard extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerCard({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 4.w),
        decoration: BoxDecoration(
          color: AppColors.backGroundWhiteEA,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          // height: 60.h,
          width: Get.width,
          decoration: BoxDecoration(
            boxShadow: AppColors.answerCardShadow,
            color: isSelected ? AppColors.main : AppColors.backGroundWhite,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: CustomTextR(
            label,
            color: isSelected ? AppColors.titleWhite : AppColors.titleBlack,
            fontSize: 15.sp,
            fontWeight: FW.medium,
          ),
        ),
      ),
    );
  }
}
