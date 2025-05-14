import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:querium/src/Features/QuizzesFeature/Bloc/Controller/quizzes_controller.dart';
import 'package:querium/src/Features/QuizzesFeature/UI/widget/uploaded_file_card.dart';
import 'package:querium/src/core/constants/sizes.dart';

class QuizzesList extends StatelessWidget {
  final QuizzesController controller;
  const QuizzesList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            mainAxisExtent: 170),
        padding: AppPadding.paddingScreenSH36,
        itemBuilder: (context, index) => UploadedFileCard(
          card: controller.quizzes[index],
        ),
        itemCount: controller.quizzes.length,
      ),
    );
  }
}
