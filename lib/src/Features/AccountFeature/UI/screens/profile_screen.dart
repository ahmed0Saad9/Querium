import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/AccountFeature/UI/widgets/card_account_details.dart';
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
      padding: AppPadding.paddingScreenSH36,
      decoration: const BoxDecoration(
        color: AppColors.scaffoldBackGround,
        image: DecorationImage(
          image: AssetImage(
            'assets/images/Gradiant.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 300.h,
            width: 300.w,
            child: Image.asset(
              'assets/images/logo.png',
              // height: 250.h,
              fit: BoxFit.cover,
            ),
          ),
          const CardAccountDetails(),
          const Spacer(),
          const ButtonDefault.main(
            title: 'Remove_Account',
            fw: FW.bold,
            titleColor: AppColors.borderRedF2,
            borderColor: AppColors.borderRedF2,
            buttonColor: AppColors.transparentColor,
          ),
          16.ESH(),
          const ButtonDefault.main(
            title: 'Logout',
            fw: FW.bold,
            titleColor: AppColors.titleBlack,
            borderColor: AppColors.borderBlack0B,
            buttonColor: AppColors.transparentColor,
          ),
          50.ESH(),
        ],
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
