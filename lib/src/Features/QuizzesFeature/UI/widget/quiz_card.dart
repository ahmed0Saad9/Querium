import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:querium/src/Features/QuizzesFeature/Bloc/Model/quizzes_model.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';

class QuizCard extends StatelessWidget {
  final QuizzesModel quizzesModel;
  const QuizCard({super.key, required this.quizzesModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(23),
      decoration: BoxDecoration(
          color: AppColors.backGroundWhite,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.black)),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextR(
              quizzesModel.title,
              fontSize: 16.sp,
              fontWeight: FW.bold,
            ),
            CustomTextR(
              quizzesModel.subject,
              fontSize: 12.sp,
              fontWeight: FW.medium,
            )
          ],
        ),
        const Spacer(),
        Image.asset(
          'assets/images/QImage.png',
          height: 55.h,
          width: 55.w,
        )
      ]),
    );
  }
}
