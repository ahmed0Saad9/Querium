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
          50.ESH(),
          Image.asset(
            'assets/images/logo.png',
            height: 200.h,
            fit: BoxFit.cover,
          ),
          50.ESH(),
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
