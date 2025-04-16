import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/controller/quiz_controller.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/model/answers_model.dart';
import 'package:querium/src/Features/HomeFeature/UI/screens/results_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';
import 'package:linear_timer/linear_timer.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      init: QuizController(),
      builder: (_) => Container(
        width: Get.width,
        height: Get.height,
        color: AppColors.backGroundWhite,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/QuizBG.png',
            ),
            BaseScaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBars.appBarBack(title: 'Compiler'),
              body: Padding(
                padding: AppPadding.paddingScreenSH36,
                child: Column(
                  children: [
                    40.ESH(),
                    _TimerWidget(controller: _),
                    34.ESH(),
                    _QuestionWidget(controller: _),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonDefault.main(
                          title: 'Previous',
                          active: false,
                          fw: FW.regular,
                          width: 200.w,
                        ),
                        20.ESW(),
                        ButtonDefault.main(
                          onTap: () => Get.off(() => const ResultsScreen()),
                          title: 'Next',
                          fw: FW.regular,
                          width: 200.w,
                        ),
                      ],
                    ),
                    50.ESH()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimerWidget extends StatelessWidget {
  final QuizController controller;
  const _TimerWidget({
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

class _QuestionWidget extends StatelessWidget {
  final QuizController controller;
  const _QuestionWidget({
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
          child: Column(children: [
            CustomTextL(
              'Question 1',
              fontSize: 24.sp,
              fontWeight: FW.medium,
            ),
            30.ESH(),
            CustomTextR(
              'To be or not to be ?',
              fontSize: 16.sp,
            ),
          ]),
        ),
        30.ESH(),
        SizedBox(
          height: 350.h,
          child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => _AnswerCard(
                    isSelected: controller.answerIdSelected ==
                        controller.answer[index].id,
                    onTapSelected: () => controller.selectTapId(
                      controller.answer[index].id,
                    ),
                    answer: controller.answer[index],
                  ),
              separatorBuilder: (context, index) => 16.ESH(),
              itemCount: controller.answer.length),
        )
      ],
    );
  }
}

class _AnswerCard extends StatelessWidget {
  final AnswersModel answer;
  final bool isSelected;
  final VoidCallback onTapSelected;

  const _AnswerCard({
    super.key,
    required this.answer,
    required this.isSelected,
    required this.onTapSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapSelected,
      borderRadius: BorderRadius.circular(18.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 4.w),
        decoration: BoxDecoration(
          color: AppColors.backGroundWhiteEA,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: 60.h,
          width: Get.width,
          decoration: BoxDecoration(
            boxShadow: AppColors.answerCardShadow,
            color: isSelected ? AppColors.main : AppColors.backGroundWhite,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Row(
            children: [
              CustomTextL(
                answer.label,
                color: isSelected ? AppColors.titleWhite : AppColors.titleBlack,
                fontSize: 15.sp,
                fontWeight: FW.medium,
              ),
              10.ESW(),
              CustomTextR(
                answer.answer,
                color: isSelected ? AppColors.titleWhite : AppColors.titleBlack,
                fontSize: 15.sp,
                fontWeight: FW.medium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
