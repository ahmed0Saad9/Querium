import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/controller/quiz_controller.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/model/question_model.dart';
import 'package:querium/src/Features/HomeFeature/UI/Widgets/answer_card.dart';
import 'package:querium/src/Features/HomeFeature/UI/Widgets/question_card.dart';
import 'package:querium/src/Features/HomeFeature/UI/Widgets/timer_widget.dart';
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
                  appBar: AppBars.appBarBack(title: 'Compiler'),
                  body: Padding(
                    padding: AppPadding.paddingScreenSH36,
                    child: Column(
                      children: [
                        40.ESH(),
                        TimerWidget(controller: _),
                        34.ESH(),
                        QuestionCard(controller: _, index: _.index),
                        AnswerWidget(controller: _),
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
                              // onTap: () => Get.off(() => const ResultsScreen()),
                              onTap: () => _.nextQuestion(),
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
          );
        });
  }
}

class AnswerWidget extends StatelessWidget {
  final QuizController controller;
  const AnswerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => AnswerCard(
          label: controller.questionsList[index].questions[index].answers[0],
          isSelected: true,
        ),
        // itemCount: controller
        //     .questions[controller.index].data[controller.index].answers.length,
        itemCount: 4,
        separatorBuilder: (context, index) => 6.ESH(),
      ),
    );
  }
}
