import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/QuizzesFeature/Bloc/Controller/quizzes_controller.dart';
import 'package:querium/src/Features/QuizzesFeature/Bloc/Model/quizzes_category_model.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

class QuizzesCategoryWidget extends StatelessWidget {
  final QuizzesController controller;
  const QuizzesCategoryWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: AppPadding.paddingScreenSH36,
          itemBuilder: (context, index) => _CategoryCard(
              quizzesCategory: controller.quizzesCategory[index],
              isSelected: controller.tapIdSelected ==
                  controller.quizzesCategory[index].id,
              onTapSelected: () =>
                  controller.selectTapId(controller.quizzesCategory[index].id)),
          separatorBuilder: (context, index) => 4.ESW(),
          itemCount: controller.quizzesCategory.length),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final QuizzesCategoryModel quizzesCategory;
  final bool isSelected;
  final VoidCallback onTapSelected;
  const _CategoryCard({
    super.key,
    required this.quizzesCategory,
    required this.isSelected,
    required this.onTapSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapSelected,
      borderRadius: BorderRadius.circular(25.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.main : AppColors.transparentColor,
            borderRadius: BorderRadius.circular(25.r),
            border: Border.all(color: AppColors.main)),
        child: Center(
          child: CustomTextL(
            quizzesCategory.title,
            fontSize: 16.sp,
            color: isSelected ? AppColors.titleWhite : AppColors.main,
            fontWeight: FW.bold,
          ),
        ),
      ),
    );
  }
}
