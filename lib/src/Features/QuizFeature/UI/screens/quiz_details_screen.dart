import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/controller/chapters_controller.dart';
import 'package:querium/src/Features/HomeFeature/UI/screens/home_screen.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/controller/quiz_controller.dart';
import 'package:querium/src/Features/QuizFeature/UI/widgets/custom_drop_down_menu.dart';
import 'package:querium/src/Features/QuizFeature/UI/screens/quiz_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

class QuizDetailsScreen extends StatelessWidget {
  final int chapterID;
  final String subjectName;
  final String chapterName;
  final String description;

// final ChaptersController controller;
  const QuizDetailsScreen({
    super.key,
    required this.chapterID,
    required this.subjectName,
    required this.chapterName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      init: QuizController(chapterID: chapterID, subjectName: subjectName),
      builder: (controller) => Container(
        color: AppColors.backGroundWhite,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/QuizBG.png',
              // width: 300.w,
            ),
            BaseScaffold(
              backgroundColor: AppColors.transparentColor,
              appBar: AppBars.appBarBack(
                title: 'Create_Quiz',
                onTap: () {
                  Get.off(() => const HomeScreen());
                },
              ),
              body: Padding(
                padding: AppPadding.paddingScreenSH36,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.ESH(),
                      QuizDetailsWidget(
                        label: controller.subjectName,
                        title: 'Subject_Name',
                      ),
                      16.ESH(),
                      QuizDetailsWidget(
                        label: chapterName,
                        title: 'Chapter_Name',
                      ),
                      16.ESH(),
                      QuizDetailsWidget(
                        label: description,
                        title: 'Description',
                      ),
                      16.ESH(),
                      QuizDetailsWidget(
                        label: '${controller.questionsList.length}',
                        title: 'Total_Questions',
                      ),
                      const Spacer(),
                      ButtonDefault.main(
                        title: 'Start_Quiz',
                        active: (controller.questionsList.isNotEmpty),
                        onTap: () {
                          Get.to(() => QuizScreen(
                                chapterID: chapterID,
                                subjectName: subjectName,
                                controller: controller,
                              ));
                          controller.startTimer(600);
                        },
                      ),
                      36.ESH(),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class QuizDetailsWidget extends StatelessWidget {
  final String label;
  final String title;

  const QuizDetailsWidget(
      {super.key, required this.label, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextL(
          title,
          fontSize: 22,
          fontWeight: FW.bold,
        ),
        12.ESH(),
        Container(
          width: Get.width,
          padding: AppPadding.paddingScreenSH16SV16,
          decoration: BoxDecoration(
            color: AppColors.backGroundWhite,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: const Color(0xff757575),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextR(
                label,
                textAlign: TextAlign.start,
                fontSize: 18,
              ),
            ],
          ),
        )
      ],
    );
  }
}
