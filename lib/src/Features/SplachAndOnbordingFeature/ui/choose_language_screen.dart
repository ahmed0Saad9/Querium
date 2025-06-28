import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/SplachAndOnbordingFeature/bloc/controlelr/choose_language_controller.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseLanguageController>(
      init: ChooseLanguageController(),
      builder: (_) => Scaffold(
        backgroundColor: AppColors.main,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            150.ESH(),
            Image.asset(
              'assets/images/logo.png',
              width: 218.w,
              height: 295.h,
              color: Colors.white,
            ),
            const Spacer(),
            LanguageSelect(controller: _),
          ],
        ),
      ),
    );
  }
}

class LanguageSelect extends StatelessWidget {
  final ChooseLanguageController controller;

  const LanguageSelect({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      // height: 204.h,
      padding: AppPadding.paddingScreenSH16SV16,
      decoration: const BoxDecoration(
        color: AppColors.backGroundGreyFD,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            16,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 9.h,
            width: 219.w,
            decoration: BoxDecoration(
              color: AppColors.dividerGrayD0,
              borderRadius: BorderRadius.circular(40.r),
            ),
          ),
          16.ESH(),
          Row(
            children: [
              // const IconSvg('FavoriteChart'),
              16.ESW(),
              CustomTextL.header(
                'select_language',
              ),
            ],
          ),
          10.ESH(),
          Row(
            children: [
              InkWell(
                onTap: () => controller.changeLanguage('ar'),
                child: Row(
                  children: [
                    Radio(
                      value: 'ar',
                      groupValue: controller.selectedLanguage,
                      onChanged: (value) => controller.changeLanguage(value!),
                      activeColor: AppColors.main,
                    ),
                    const CustomTextL('العربية',
                        fontSize: 16, fontWeight: FW.bold),
                  ],
                ),
              ),
              100.ESW(),
              InkWell(
                onTap: () => controller.changeLanguage('en'),
                child: Row(
                  children: [
                    Radio(
                      value: 'en',
                      groupValue: controller.selectedLanguage,
                      onChanged: (value) => controller.changeLanguage(value!),
                      activeColor: AppColors.main,
                    ),
                    const CustomTextL('English',
                        fontSize: 16, fontWeight: FW.bold),
                  ],
                ),
              ),
            ],
          ),
          26.ESH(),
          ButtonDefault.main(
            onTap: () => controller.moveToOnBoarding(),
            title: 'Confirm',
            active: (controller.selectedLanguage != null),
          )
        ],
      ),
    );
  }
}
