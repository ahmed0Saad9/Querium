import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/controller/quiz_controller.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/model/question_model.dart';
import 'package:querium/src/Features/QuizFeature/UI/widgets/answer_card.dart';
import 'package:querium/src/Features/QuizFeature/UI/widgets/question_card.dart';
import 'package:querium/src/Features/QuizFeature/UI/widgets/timer_widget.dart';
import 'package:querium/src/Features/QuizFeature/UI/screens/results_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';
import 'package:linear_timer/linear_timer.dart';

class QuizScreen extends StatelessWidget {
  final int chapterID;
  final String subjectName;
  const QuizScreen(
      {super.key, required this.chapterID, required this.subjectName});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
        init: QuizController(chapterID: chapterID, subjectName: subjectName),
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
                  appBar: AppBars.appBarBack(title: subjectName),
                  body: Padding(
                    padding: AppPadding.paddingScreenSH36,
                    child: (_.questionsList.isNotEmpty)
                        ? Column(
                            children: [
                              40.ESH(),
                              TimerWidget(controller: _),
                              34.ESH(),
                              QuestionCard(
                                controller: _,
                              ),
                              30.ESH(),
                              AnswerWidget(controller: _),
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
                                      _.isLastQuestion
                                          ? Get.off(() => const ResultsScreen())
                                          : _.nextQuestion();
                                    },
                                    title: _.isLastQuestion ? 'finish' : 'Next',
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
