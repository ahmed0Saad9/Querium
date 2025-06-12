import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/BaseFeature/Bloc/Controller/b_controller.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/controller/quiz_controller.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/controller/quiz_details_controller.dart';
import 'package:querium/src/Features/QuizFeature/UI/widgets/custom_drop_down_menu.dart';
import 'package:querium/src/Features/QuizFeature/UI/screens/quiz_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/StaggeredAnimations/base_column.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/TextFields/text_field_default.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/services/svg_widget.dart';
import 'package:querium/src/core/utils/extensions.dart';

class QuizDetailsScreen extends StatelessWidget {
  final int chapterID;
  final String subjectName;
  const QuizDetailsScreen(
      {super.key, required this.chapterID, required this.subjectName});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizDetailsController>(
      init: QuizDetailsController(),
      builder: (controller) => Stack(
        children: [
          Image.asset(
            'assets/images/QuizBG.png',
            // width: 300.w,
          ),
          BaseScaffold(
            backgroundColor: AppColors.transparentColor,
            appBar: AppBars.appBarBack(
              isBack: true,
              title: 'Create_Quiz',
            ),
            body: Padding(
              padding: AppPadding.paddingScreenSH36,
              child: Column(children: [
                Column(
                  children: [
                    50.ESH(),
                    const CustomDropDownMenu(
                      hint: 'Number_of_Questions',
                      items: <DropdownMenuEntry<String>>[
                        DropdownMenuEntry(value: '10', label: '10'),
                        DropdownMenuEntry(value: '20', label: '20'),
                      ],
                    ),
                    40.ESH(),
                    CustomDropDownMenu(
                      hint: 'Quiz_Difficulty',
                      items: <DropdownMenuEntry<String>>[
                        DropdownMenuEntry(value: '1', label: 'Easy'.tr),
                        DropdownMenuEntry(value: '2', label: 'Medium'.tr),
                        DropdownMenuEntry(value: '3', label: 'Hard'.tr),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                ButtonDefault.main(
                  title: 'Continue',
                  onTap: () => Get.off(() => QuizScreen(
                        chapterID: chapterID,
                        subjectName: subjectName,
                      )),
                ),
                36.ESH(),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
