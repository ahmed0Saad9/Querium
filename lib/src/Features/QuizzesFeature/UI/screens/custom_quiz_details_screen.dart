import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/controller/chapters_controller.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/controller/quiz_controller.dart';
import 'package:querium/src/Features/QuizFeature/UI/screens/quiz_details_screen.dart';
import 'package:querium/src/Features/QuizFeature/UI/widgets/custom_drop_down_menu.dart';
import 'package:querium/src/Features/QuizFeature/UI/screens/quiz_screen.dart';
import 'package:querium/src/Features/QuizzesFeature/Bloc/Controller/custom_quiz_controller.dart';
import 'package:querium/src/Features/QuizzesFeature/UI/screens/custom_quiz_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

class CustomQuizDetailsScreen extends StatelessWidget {
  final int fileId;
  final String fileName;
  final String status;

  const CustomQuizDetailsScreen({
    super.key,
    required this.fileId,
    required this.fileName,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomQuizController>(
      init: CustomQuizController(fileId: fileId),
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.ESH(),
                    QuizDetailsWidget(
                      label: fileName,
                      title: 'File_Name',
                    ),
                    16.ESH(),
                    QuizDetailsWidget(
                      label: '${controller.questionsList.length}',
                      title: 'Total_Questions',
                    ),
                    16.ESH(),
                    const Spacer(),
                    ButtonDefault.main(
                      title: 'Start_Quiz',
                      active: (controller.questionsList.isNotEmpty),
                      onTap: () {
                        Get.to(() => CustomQuizScreen(
                              fileId: fileId,
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
    );
  }
}
