import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/QuizzesFeature/Bloc/Model/quizzes_model.dart';
import 'package:querium/src/Features/QuizzesFeature/Bloc/Model/uploaded_file_model.dart';
import 'package:querium/src/Features/QuizzesFeature/UI/screens/custom_quiz_screen.dart';
import 'package:querium/src/Features/SettingsFeature/UI/screens/settings_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/services/svg_widget.dart';
import 'package:querium/src/core/utils/extensions.dart';

class UploadedFileCard extends StatelessWidget {
  final UploadedFile card;
  const UploadedFileCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        (card.status == 'Approved')
            ? Get.to(() => CustomQuizScreen(
               fileId: card.id,))
            : null;
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.backGroundGreyF4,
          boxShadow: AppColors.cardShadowBlack,
          borderRadius: BorderRadius.circular(
            12.r,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 138.h,
                width: Get.width,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
                child: Image.asset(
                  'assets/images/LectureImage.png',
                )),
            10.ESH(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120.w,
                  child: CustomTextR(
                    card.fileName,
                    isOverFlow: true,
                    fontSize: 14.sp,
                    fontWeight: FW.bold,
                  ),
                ),
                const Spacer(),
                (card.status == 'Pending')
                    ? const IconSvg('Pending')
                    : (card.status == 'Approved')
                        ? const IconSvg('Approved')
                        : const IconSvg('Rejected'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
