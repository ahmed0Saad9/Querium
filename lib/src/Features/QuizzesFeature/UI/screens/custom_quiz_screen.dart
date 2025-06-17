import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/controller/quiz_controller.dart';
import 'package:querium/src/Features/QuizFeature/UI/widgets/answer_card.dart';
import 'package:querium/src/Features/QuizFeature/UI/widgets/question_card.dart';
import 'package:querium/src/Features/QuizFeature/UI/widgets/timer_widget.dart';
import 'package:querium/src/Features/QuizzesFeature/Bloc/Controller/custom_quiz_controller.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

class CustomQuizScreen extends StatelessWidget {
  final int fileId;
  const CustomQuizScreen({
    super.key,
    required this.fileId,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomQuizController>(
        init: CustomQuizController(fileId: fileId),
        builder: (_) {
          return Container(
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
                  appBar: AppBars.appBarBack(title: 'quiz'),
                  body: Padding(
                    padding: AppPadding.paddingScreenSH36,
                    child: (_.questionsList.isNotEmpty)
                        ? Column(
                            children: [
                              40.ESH(),
                              _TimerWidget(controller: _),
                              34.ESH(),
                              CustomQuestionCard(
                                controller: _,
                              ),
                              30.ESH(),
                              CustomAnswerWidget(controller: _),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ButtonDefault.main(
                                    title: 'Previous',
                                    fw: FW.regular,
                                    width: 200.w,
                                    onTap: () => _.previousQuestion(),
                                  ),
                                  20.ESW(),
                                  ButtonDefault.main(
                                    onTap: () {
                                      _.validateAnswer();
                                    },
                                    title: _.isLastQuestion ? 'Finish' : 'Next',
                                    fw: FW.regular,
                                    width: 200.w,
                                  ),
                                ],
                              ),
                              50.ESH()
                            ],
                          )
                        : const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SpinKitWave(
                                color: AppColors.main,
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class CustomAnswerWidget extends StatelessWidget {
  final CustomQuizController controller;
  const CustomAnswerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => AnswerCard(
          label: controller.questionsList[controller.index].answers[index],
          isSelected: controller.answerIdSelected == index,
          onTap: () => controller.selectTapId(index),
        ),
        itemCount: 4,
        separatorBuilder: (context, index) => 6.ESH(),
      ),
    );
  }
}

class CustomQuestionCard extends StatelessWidget {
  final CustomQuizController controller;

  const CustomQuestionCard({
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

class _TimerWidget extends StatelessWidget {
  final CustomQuizController controller;
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
            forward: false,
            minHeight: 7,
            color: AppColors.linearTimer,
            duration: Duration(
              minutes: 10,
            ),
          ),
        ),
      ],
    );
  }
}
