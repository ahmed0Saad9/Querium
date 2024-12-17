import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/SettingsFeature/UI/screens/settings_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Cards/card_avatar_image.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/services/svg_widget.dart';
import 'package:querium/src/core/utils/extensions.dart';
import 'package:querium/src/core/utils/storage_util.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: AppColors.scaffoldBackGround,
      child: SafeArea(
        top: true,
        child: Padding(
          padding: AppPadding.paddingScreenSH36,
          child: Column(
            children: [
              50.ESH(),
              CardAvatarImage(
                  size: 160,
                  image: LocalStorageCubit().getItem(
                        key: 'avatar',
                      ) ??
                      ''),
              80.ESH(),
              _Tab(
                onTap: () {},
                label: 'Personal info',
                icon: 'PersonalInfo',
              ),
              const Divider(
                color: AppColors.dividerGrayC7,
                thickness: 0.5,
                height: 32,
              ),
              _Tab(
                onTap: () {},
                label: 'Rewards',
                icon: 'Rewards',
              ),
              const Divider(
                color: AppColors.dividerGrayC7,
                thickness: 0.5,
                height: 32,
              ),
              _Tab(
                onTap: () {},
                label: 'Change Password',
                icon: 'ChangePassword',
              ),
              const Divider(
                color: AppColors.dividerGrayC7,
                thickness: 0.5,
                height: 32,
              ),
              _Tab(
                onTap: () => Get.to(() => const SettingsScreen(),
                    transition: Transition.rightToLeftWithFade),
                label: 'Settings',
                icon: 'setting',
              ),
              const Divider(
                color: AppColors.dividerGrayC7,
                thickness: 0.5,
                height: 32,
              ),
              _Tab(
                onTap: () {},
                label: 'Remove Account',
                icon: 'RemoveAcc',
              ),
              50.ESH(),
              const ButtonDefault.main(
                title: 'Logout',
                fw: FW.bold,
                titleColor: AppColors.borderRedF2,
                borderColor: AppColors.borderRedF2,
                buttonColor: AppColors.transparentColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;
  const _Tab(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          IconSvg(
            icon,
            size: 32,
          ),
          18.ESW(),
          CustomTextL(
            label,
            color: AppColors.titleGray52,
            fontSize: 18.sp,
            fontWeight: FW.medium,
          ),
        ],
      ),
    );
  }
}
