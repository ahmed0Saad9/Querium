import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/BaseFeature/Bloc/Controller/b_controller.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/controller/quiz_controller.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/controller/quiz_details_controller.dart';
import 'package:querium/src/Features/HomeFeature/UI/Widgets/custom_drop_down_menu.dart';
import 'package:querium/src/Features/HomeFeature/UI/screens/quiz_screen.dart';
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
  QuizDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizDetailsController>(
      init: QuizDetailsController(),
      builder: (controller) => Container(
        color: AppColors.wight,
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Image.asset('assets/images/QuizBG.png', width: 300.w),
            BaseScaffold(
              backgroundColor: AppColors.transparentColor,
              appBar: AppBars.appBarBack(
                isBack: true,
                title: 'Create Quiz',
              ),
              body: Padding(
                padding: AppPadding.paddingScreenSH36,
                child: BaseStaggeredColumn(children: [
                  Column(
                    children: [
                      50.ESH(),
                      const CustomDropDownMenu(
                        hint: 'Number of Question',
                        items: <DropdownMenuEntry<String>>[
                          DropdownMenuEntry(value: '10', label: '10'),
                          DropdownMenuEntry(value: '20', label: '20'),
                        ],
                      ),
                      40.ESH(),
                      const CustomDropDownMenu(
                        hint: 'Quiz Duration',
                        items: <DropdownMenuEntry<String>>[
                          DropdownMenuEntry(value: '10', label: '10 minutes'),
                          DropdownMenuEntry(value: '20', label: '20 minutes'),
                        ],
                      ),
                      25.ESH(),
                      const Row(
                        children: [
                          CustomTextL('Question Type'),
                        ],
                      ),
                      25.ESH(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () =>
                                controller.changeQuestionType('True&false'),
                            child: Row(
                              children: [
                                Radio(
                                  value: 'True&false',
                                  groupValue: controller.questionType,
                                  onChanged: (value) =>
                                      controller.changeQuestionType(value!),
                                  activeColor: AppColors.main,
                                ),
                                const CustomTextL('True&false',
                                    fontSize: 18, fontWeight: FW.bold),
                              ],
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () =>
                                controller.changeQuestionType('MultiChoice'),
                            child: Row(
                              children: [
                                Radio(
                                  value: 'MultiChoice',
                                  groupValue: controller.questionType,
                                  onChanged: (value) =>
                                      controller.changeQuestionType(value!),
                                  activeColor: AppColors.main,
                                ),
                                const CustomTextL('MultiChoice',
                                    fontSize: 18, fontWeight: FW.bold),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  380.ESH(),
                  ButtonDefault.main(
                    title: 'Continue',
                    onTap: () => Get.off(() => const QuizScreen()),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
