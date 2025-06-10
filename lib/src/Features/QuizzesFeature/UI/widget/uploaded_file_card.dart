import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/QuizzesFeature/Bloc/Model/quizzes_model.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/services/svg_widget.dart';
import 'package:querium/src/core/utils/extensions.dart';

class UploadedFileCard extends StatelessWidget {
  final QuizzesModel card;
  const UploadedFileCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.backGroundGreyF4,
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
              CustomTextR(
                card.title,
                fontSize: 14.sp,
                fontWeight: FW.bold,
              ),
              const Spacer(),
              card.isPending
                  ? IconSvg('Pending')
                  : card.isApproved
                      ? IconSvg('Approved')
                      : IconSvg('Rejected'),
            ],
          ),
        ],
      ),
    );
  }
}
