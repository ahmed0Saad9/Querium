import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/SettingsFeature/Bloc/controller/settings_controller.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/StaggeredAnimations/base_column.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/services/svg_widget.dart';
import 'package:querium/src/core/utils/extensions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (controller) => Container(
        height: Get.height,
        width: Get.width,
        // padding: AppPadding.paddingScreenSH36,
        decoration: const BoxDecoration(
          color: AppColors.scaffoldBackGround,
          image: DecorationImage(
            image: AssetImage(
              'assets/images/Gradiant.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BaseScaffold(
            appBar: AppBars.appBarBack(title: 'Settings'),
            backgroundColor: AppColors.transparentColor,
            body: Padding(
              padding: AppPadding.paddingScreenSH36,
              child: BaseStaggeredColumn(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                  50.ESH(),
                  const _SectionHeader(
                    title: 'Notifications',
                    icon: 'Notification',
                  ),
                  18.ESH(),
                  _SettingsSwitchTab(
                    label: 'Notification',
                    switchValue: controller.notification,
                    onToggle: (p0) => controller.toggleNotification(),
                  ),
                  24.ESH(),
                  _SettingsSwitchTab(
                    label: 'Update',
                    switchValue: controller.Update,
                    onToggle: (p0) => controller.toggleUpdate(),
                  ),
                  30.ESH(),
                  const _SectionHeader(title: 'Other', icon: 'Other'),
                  20.ESH(),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => controller.changeLanguage('ar'),
                        child: Row(
                          children: [
                            Radio(
                              value: 'ar',
                              groupValue: controller.selectedLanguage,
                              onChanged: (value) =>
                                  controller.changeLanguage(value!),
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
                              onChanged: (value) =>
                                  controller.changeLanguage(value!),
                              activeColor: AppColors.main,
                            ),
                            const CustomTextL('English',
                                fontSize: 16, fontWeight: FW.bold),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String icon;
  const _SectionHeader({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconSvg(
          icon,
          size: 40,
        ),
        14.ESW(),
        CustomTextL(
          title,
          color: AppColors.titleGreen28,
          fontWeight: FW.bold,
        )
      ],
    );
  }
}

class _SettingsArrowTab extends StatelessWidget {
  final String label;
  const _SettingsArrowTab({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextL(
          label,
          fontWeight: FW.bold,
          color: AppColors.titleGray52,
        ),
        const Spacer(),
        const IconSvg('ArrowRight'),
      ],
    );
  }
}

class _SettingsSwitchTab extends StatelessWidget {
  final String label;
  final bool switchValue;
  final void Function(bool) onToggle;
  const _SettingsSwitchTab(
      {super.key,
      required this.label,
      required this.switchValue,
      required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextL(
          label,
          fontWeight: FW.bold,
          color: AppColors.titleGray52,
        ),
        const Spacer(),
        FlutterSwitch(
          width: 63.w,
          height: 29.h,
          toggleSize: 22,
          padding: 3.62,
          inactiveColor: AppColors.backGroundWhite,
          inactiveToggleColor: AppColors.main,
          activeColor: AppColors.main,
          value: switchValue,
          onToggle: onToggle,
        ),
      ],
    );
  }
}
