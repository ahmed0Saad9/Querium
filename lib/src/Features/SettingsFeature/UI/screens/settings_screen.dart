import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/SettingsFeature/Bloc/controller/settings_controller.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Cards/card_avatar_image.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/StaggeredAnimations/base_column.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/services/svg_widget.dart';
import 'package:querium/src/core/utils/extensions.dart';
import 'package:querium/src/core/utils/storage_util.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (controller) => BaseScaffold(
          appBar: AppBars.appBarBack(title: 'Settings'),
          body: Padding(
            padding: AppPadding.paddingScreenSH36,
            child: BaseStaggeredColumn(
              children: [
                30.ESH(),
                Row(
                  children: [
                    CardAvatarImage(
                        size: 75,
                        image: LocalStorageCubit().getItem(
                              key: 'avatar',
                            ) ??
                            ''),
                    16.ESW(),
                    const CustomTextR(
                      'Ahmed',
                      fontWeight: FW.bold,
                    )
                  ],
                ),
                20.ESH(),
                const _SectionHeader(
                  title: 'Account',
                  icon: 'Account',
                ),
                18.ESH(),
                const _SettingsArrowTab(
                  label: 'Edit Profile',
                ),
                24.ESH(),
                const _SettingsArrowTab(
                  label: 'Change Password',
                ),
                24.ESH(),
                const _SettingsArrowTab(
                  label: 'Privacy',
                ),
                30.ESH(),
                const _SectionHeader(
                  title: 'Notification',
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
                18.ESH(),
                _SettingsSwitchTab(
                  label: 'Dark Mode',
                  switchValue: controller.darkMode,
                  onToggle: (p0) => controller.toggleDarkMode(),
                )
              ],
            ),
          )),
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
          inactiveColor: AppColors.backGroundGreyE5,
          inactiveToggleColor: AppColors.main,
          activeColor: AppColors.main,
          value: switchValue,
          onToggle: onToggle,
        ),
      ],
    );
  }
}
