import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/HomeFeature/UI/screens/home_screen.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/controller/quiz_controller.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/controller/review_answer_controller.dart';
import 'package:querium/src/Features/QuizFeature/UI/widgets/question_card.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

class ReviewAnswerScreen extends StatelessWidget {
  const ReviewAnswerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewController = Get.put(ReviewAnswerController());
    final quizController = Get.find<QuizController>();

    return Container(
      width: Get.width,
      height: Get.height,
      color: AppColors.backGroundWhite,
      child: Stack(
        children: [
          Image.asset('assets/images/QuizBG.png'),
          BaseScaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBars.appBarBack(
              title: 'Review_Answers',
            ),
            body: Padding(
              padding: AppPadding.paddingScreenSH36,
              child: Column(
                children: [
                  40.ESH(),
                  _buildQuestionInfo(reviewController, quizController),
                  20.ESH(),
                  _buildQuestionCard(quizController),
                  30.ESH(),
                  _buildAnswerWidget(reviewController, quizController),
                  _buildNavigationButtons(reviewController),
                  50.ESH(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionInfo(
      ReviewAnswerController reviewController, QuizController quizController) {
    return GetBuilder<ReviewAnswerController>(
      builder: (_) {
        final result = reviewController
            .questionResults[reviewController.currentQuestionIndex];
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextL('Question ${reviewController.currentQuestionIndex + 1}',
                fontSize: 18, fontWeight: FW.bold),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: result.isCorrect
                    ? AppColors.correctAnswer
                    : AppColors.incorrectAnswer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomTextL(result.isCorrect ? 'Correct' : 'Incorrect',
                  color: AppColors.titleWhite),
            ),
          ],
        );
      },
    );
  }

  Widget _buildQuestionCard(QuizController quizController) {
    return GetBuilder<QuizController>(
      id: 'question_card',
      builder: (_) {
        return QuestionCard(controller: quizController);
      },
    );
  }

  Widget _buildAnswerWidget(
      ReviewAnswerController reviewController, QuizController quizController) {
    return GetBuilder<ReviewAnswerController>(
      builder: (_) {
        return _AnswerWidget(
          quizController: quizController,
          reviewAnswerController: reviewController,
        );
      },
    );
  }

  Widget _buildNavigationButtons(ReviewAnswerController controller) {
    return GetBuilder<ReviewAnswerController>(
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonDefault.main(
              title: 'Previous',
              fw: FW.regular,
              width: 200.w,
              onTap: () => controller.goToPreviousQuestion(),
            ),
            20.ESW(),
            ButtonDefault.main(
              title: 'Next',
              fw: FW.regular,
              width: 200.w,
              onTap: () => controller.goToNextQuestion(),
            ),
          ],
        );
      },
    );
  }
}

class AnswerCard extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isCorrect;
  final bool showCorrectness;

  const AnswerCard({
    super.key,
    required this.label,
    this.isSelected = false,
    this.isCorrect = false,
    this.showCorrectness = false,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = AppColors.backGroundWhite;
    Color borderColor = Colors.transparent;
    IconData? icon;
    Color iconColor = Colors.transparent;

    if (showCorrectness) {
      if (isCorrect) {
        backgroundColor = Colors.green[100]!;
        borderColor = Colors.green;
        icon = Icons.check;
        iconColor = Colors.green;
      } else if (isSelected) {
        backgroundColor = Colors.red[100]!;
        borderColor = Colors.red;
        icon = Icons.close;
        iconColor = Colors.red;
      }
    } else if (isSelected) {
      backgroundColor = Colors.blue[100]!;
      borderColor = Colors.blue;
    }

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.backGroundWhiteEA.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: AppColors.answerCardShadow,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            if (icon != null) Icon(icon, color: iconColor),
          ],
        ),
      ),
    );
  }
}

class _AnswerWidget extends StatelessWidget {
  final QuizController quizController;
  final ReviewAnswerController reviewAnswerController;
  const _AnswerWidget({
    super.key,
    required this.quizController,
    required this.reviewAnswerController,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      builder: (controller) {
        final question = controller.questionsList[controller.index];
        final result = reviewAnswerController
            .questionResults[reviewAnswerController.currentQuestionIndex];

        return Expanded(
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final answer = question.answers[index];
              final isCorrect = answer == question.correctAnswer;
              final isSelected = result.selectedAnswerIndex == index;

              return AnswerCard(
                label: answer,
                isSelected: isSelected,
                isCorrect: isCorrect,
                showCorrectness: true,
              );
            },
            itemCount: question.answers.length,
            separatorBuilder: (context, index) => 6.ESH(),
          ),
        );
      },
    );
  }
}
