import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/controller/show_answers_controller.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/model/question_result.dart';
import 'package:querium/src/Features/QuizzesFeature/Bloc/Controller/custom_quiz_controller.dart';
import 'package:querium/src/Features/QuizzesFeature/UI/screens/custom_review_answer_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

class CustomShowAnswersScreen extends StatelessWidget {
  const CustomShowAnswersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowAnswersController>(
      init: ShowAnswersController(),
      builder: (controller) {
        return BaseScaffold(
          backgroundColor: AppColors.scaffoldBackGround,
          appBar: AppBars.appBarBack(title: 'إظهار الإجابات'),
          body: Padding(
            padding: AppPadding.paddingScreenSH36,
            child: ListView(
              children: [
                40.ESH(),
                if (controller.answersListCards.isEmpty)
                  _buildEmptyState()
                else
                  _buildAnswersGrid(controller),
                70.ESH(),
                _buildLegend(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.help_outline, size: 50.w, color: AppColors.main),
          20.ESH(),
          const CustomTextL('لا توجد بيانات للإجابات'),
        ],
      ),
    );
  }

  Widget _buildAnswersGrid(ShowAnswersController controller) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: controller.answersListCards.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) => _AnswerCard(
        answerStatus: controller.answersListCards[index].questionStatus,
        questionNum: controller.answersListCards[index].questionNumber,
        onTap: () => _navigateToReview(
          controller.answersListCards[index].questionNumber - 1,
          controller.questionResults,
        ),
      ),
    );
  }

  void _navigateToReview(
    int questionIndex,
    List<QuestionResult> results,
  ) {
    Get.to(
      () => const CustomReviewAnswerScreen(),
      arguments: {
        'questionIndex': questionIndex,
        'results': results,
      },
    );
  }

  Widget _buildLegend() {
    return Column(
      children: [
        _buildLegendItem(AppColors.correctAnswer, 'الإجابة الصحيحة'),
        35.ESH(),
        _buildLegendItem(AppColors.incorrectAnswer, 'الإجابة الخاطئة'),
        35.ESH(),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: color,
          ),
          width: 23.w,
          height: 21.h,
        ),
        20.ESW(),
        CustomTextL(text),
      ],
    );
  }
}

class _AnswerCard extends StatelessWidget {
  final int questionNum;
  final Color answerStatus;
  final VoidCallback onTap;

  const _AnswerCard({
    required this.questionNum,
    required this.answerStatus,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: answerStatus,
          borderRadius: BorderRadius.circular(21.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: CustomTextL(
            '$questionNum',
            fontSize: 53.sp,
            color: AppColors.titleWhite,
          ),
        ),
      ),
    );
  }
}
