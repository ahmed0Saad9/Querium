import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/HomeFeature/UI/screens/showa_nswers_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/StaggeredAnimations/base_column.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.wight,
      width: Get.width,
      height: Get.height,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/QuizBG.png',
          ),
          BaseScaffold(
            backgroundColor: AppColors.transparentColor,
            appBar: AppBars.appBarBack(
              isBack: true,
              title: 'Results',
            ),
            body: Padding(
              padding: AppPadding.paddingScreenSH36,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    50.ESH(),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/CircleDottedBorder.png',
                            width: 243.w,
                            height: 243.h,
                          ),
                        ),
                        const CustomTextR(
                          '60%',
                          fontSize: 55,
                          color: AppColors.main,
                          fontWeight: FW.bold,
                        ),
                      ],
                    ),
                    44.ESH(),
                    const CustomTextL(
                      'Total_answers',
                      fontWeight: FW.bold,
                      fontSize: 24,
                      color: AppColors.main,
                    ),
                    18.ESH(),
                    Row(
                      children: [
                        const CustomTextL(
                          'Total_Exam_degree',
                          fontSize: 20,
                          color: AppColors.main,
                        ),
                        4.ESW(),
                        const CustomTextR(
                          '10',
                          fontSize: 20,
                          color: AppColors.main,
                        ),
                      ],
                    ),
                    12.ESH(),
                    Row(
                      children: [
                        const CustomTextL(
                          'Right_Questions_Count',
                          fontSize: 20,
                          color: AppColors.main,
                        ),
                        4.ESW(),
                        const CustomTextR(
                          '6',
                          fontSize: 20,
                          color: AppColors.main,
                        ),
                      ],
                    ),
                    12.ESH(),
                    Row(
                      children: [
                        const CustomTextL(
                          'Wrong_Questions_Count',
                          fontSize: 20,
                          color: AppColors.main,
                        ),
                        4.ESW(),
                        const CustomTextR(
                          '4',
                          fontSize: 20,
                          color: AppColors.main,
                        ),
                      ],
                    ),
                    // 42.ESH(),
                    Spacer(),
                    ButtonDefault.main(
                      title: 'Show_answers',
                      onTap: () => Get.to(() => const ShowAnswersScreen()),
                    ),
                    23.ESH(),
                    const ButtonDefault.main(
                      title: 'Try_Again',
                      iconSvg: 'TryAgain',
                      iconSize: 32,
                    ),
                    36.ESH(),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
