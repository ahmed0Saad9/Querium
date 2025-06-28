import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:querium/src/Features/BaseBNBFeature/Bloc/Controller/base_BNB_controller.dart';
import 'package:querium/src/Features/CustomQuizzesFeature/UI/widget/no_files_uploaded.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/controller/chapters_controller.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/model/chapters_model.dart';
import 'package:querium/src/Features/QuizFeature/UI/screens/quiz_details_screen.dart';
import 'package:querium/src/Features/QuizFeature/UI/screens/quiz_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/utils/extensions.dart';

class ChaptersScreen extends StatelessWidget {
  int subjectID;
  ChaptersScreen({super.key, required this.subjectID});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChaptersController>(
      init: ChaptersController(subjectID: subjectID),
      builder: (controller) => BaseScaffold(
          appBar: AppBars.appBarBack(title: 'Chapters', isBack: true),
          backgroundColor: AppColors.backGroundGreyF4,
          body: (controller.chapters.isNotEmpty)
              ? ListView.separated(
                  itemBuilder: (context, index) => ChaptersCard(
                        chapters: controller.chapters[index],
                        chapterID: controller.chapters[index].id,
                      ),
                  separatorBuilder: (context, index) => 16.ESH(),
                  padding: EdgeInsets.only(
                      right: 36.w, left: 36.w, top: 40.h, bottom: 16.h),
                  itemCount: controller.chapters.length)
              : NoDataUploaded(
                  title: 'No_chapters_have_been_uploaded_for_this_subject',
                  onTap: () => Get.back(),
                  buttonTitle: 'Select_another_subject')),
    );
  }
}

class ChaptersCard extends StatelessWidget {
  final Chapters chapters;
  final int chapterID;
  const ChaptersCard({
    super.key,
    required this.chapters,
    required this.chapterID,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(
        () => QuizDetailsScreen(
          chapterID: chapterID,
          subjectName: chapters.subjectName,
          chapterName: chapters.title,
          description: chapters.description,
        ),
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
                chapters.title,
                fontSize: 16.sp,
                fontWeight: FW.bold,
              ),
              6.ESH(),
              CustomTextR(
                chapters.description,
                fontSize: 12.sp,
                fontWeight: FW.medium,
                color: AppColors.titleGray95,
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
