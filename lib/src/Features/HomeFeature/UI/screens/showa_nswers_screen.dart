import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/controller/show_answers_controller.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

class ShowAnswersScreen extends StatelessWidget {
  const ShowAnswersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowAnswersController>(
      init: ShowAnswersController(),
      builder: (controller) => BaseScaffold(
        backgroundColor: AppColors.scaffoldBackGround,
        appBar: AppBars.appBarBack(title: 'Show answers'),
        body: Padding(
          padding: AppPadding.paddingScreenSH36,
          child: ListView(
            children: [
              50.ESH(),
              GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: controller.answersListCards.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 12,
                ),
                itemBuilder: (context, index) => _AnswerCard(
                  answerStatus:
                      controller.answersListCards[index].questionStatus,
                  questionNum:
                      controller.answersListCards[index].questionNumber,
                ),
              ),
              70.ESH(),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.correctAnswer),
                    width: 23.w,
                    height: 21.h,
                  ),
                  20.ESW(),
                  const CustomTextL(
                    'Correct Answer',
                  ),
                ],
              ),
              35.ESH(),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.incorrectAnswer),
                    width: 23.w,
                    height: 21.h,
                  ),
                  20.ESW(),
                  const CustomTextL(
                    'Incorrect Answer',
                  ),
                ],
              ),
              35.ESH(),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.notAnswered),
                    width: 23.w,
                    height: 21.h,
                  ),
                  20.ESW(),
                  const CustomTextL(
                    'Not Answered',
                  ),
                ],
              ),
              35.ESH(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnswerCard extends StatelessWidget {
  final int questionNum;
  final Color answerStatus;
  const _AnswerCard(
      {super.key, required this.questionNum, required this.answerStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: answerStatus,
        borderRadius: BorderRadius.circular(21.r),
      ),
      child: Center(
          child: CustomTextL(
        '$questionNum',
        fontSize: 53,
        color: AppColors.titleWhite,
      )),
    );
  }
}
