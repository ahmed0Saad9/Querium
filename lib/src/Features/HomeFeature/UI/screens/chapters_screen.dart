import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:querium/src/Features/HomeFeature/UI/screens/quiz_details_screen.dart';
import 'package:querium/src/Features/HomeFeature/UI/screens/quiz_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/utils/extensions.dart';

class ChaptersScreen extends StatelessWidget {
  const ChaptersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBars.appBarBack(title: 'Chapters'),
      backgroundColor: AppColors.backGroundGreyF4,
      body: ListView.separated(
          itemBuilder: (context, index) => const ChaptersCard(),
          separatorBuilder: (context, index) => 16.ESH(),
          padding:
              EdgeInsets.only(right: 36.w, left: 36.w, top: 40.h, bottom: 16.h),
          itemCount: 7),
    );
  }
}

class ChaptersCard extends StatelessWidget {
  const ChaptersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(
        () => const QuizDetailsScreen(),
        transition: Transition.rightToLeftWithFade,
        duration: const Duration(milliseconds: 200),
      ),
      child: Container(
        padding: const EdgeInsets.all(23),
        decoration: BoxDecoration(
          color: AppColors.backGroundWhite,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextR(
                'chapter 1',
                fontSize: 16.sp,
                fontWeight: FW.bold,
              ),
              CustomTextR(
                'By: Antony Hopkins',
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
      ),
    );
  }
}
