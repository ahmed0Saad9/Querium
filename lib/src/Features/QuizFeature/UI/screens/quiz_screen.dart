import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/BaseBNBFeature/UI/screens/base_BNB_screen.dart';
import 'package:querium/src/Features/HomeFeature/UI/screens/chapters_screen.dart';
import 'package:querium/src/Features/HomeFeature/UI/screens/home_screen.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/controller/quiz_controller.dart';
import 'package:querium/src/Features/QuizFeature/UI/screens/quiz_details_screen.dart';
import 'package:querium/src/Features/QuizFeature/UI/widgets/answer_card.dart';
import 'package:querium/src/Features/QuizFeature/UI/widgets/question_card.dart';
import 'package:querium/src/Features/QuizFeature/UI/widgets/timer_widget.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

class QuizScreen extends StatelessWidget {
  final int chapterID;
  final String subjectName;

  const QuizScreen({
    super.key,
    required this.chapterID,
    required this.subjectName,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      builder: (controller) => Container(
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
              appBar: AppBars.appBarBack(
                title: subjectName,
                isBack: false,
                onTap: () {
                  Get.back();
                  Get.back();
                },
              ),
              body: Padding(
                padding: AppPadding.paddingScreenSH36,
                child: (controller.questionsList.isNotEmpty)
                    ? Column(
                        children: [
                          40.ESH(),
                          TimerWidget(controller: controller),
                          34.ESH(),
                          QuestionCard(
                            controller: controller,
                          ),
                          30.ESH(),
                          AnswerWidget(controller: controller),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ButtonDefault.main(
                                title: 'Previous',
                                fw: FW.regular,
                                width: 200.w,
                                onTap: () => controller.previousQuestion(),
                              ),
                              20.ESW(),
                              ButtonDefault.main(
                                onTap: () {
                                  controller.validateAnswer();
                                },
                                title: controller.isLastQuestion
                                    ? 'Finish'
                                    : 'Next',
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
      ),
    );
  }
}

class AnswerWidget extends StatelessWidget {
  final QuizController controller;
  const AnswerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      builder: (controller) => Expanded(
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
      ),
    );
  }
}
