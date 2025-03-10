import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Bloc/Controller/forget_password_controller.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Widgets/bottom_resend_code.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/StaggeredAnimations/base_column.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/services/pin_code.dart';
import 'package:querium/src/core/utils/extensions.dart';

class PinCodeScreen extends StatelessWidget {
  final String title;

  const PinCodeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBars.appBarBack(
        title: title,
      ),
      body: GetBuilder<ForgetPasswordController>(
        builder: (_) => Padding(
          padding: AppPadding.paddingScreenSH36,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            50.ESH(),
            const CustomTextL(
              'Enter 4 Digits Code',
              fontSize: 28,
              fontWeight: FW.bold,
            ),
            8.ESH(),
            CustomTextL.subtitle(
              'Enter the 4 digits code that you received on\nyour email.',
              fontWeight: FW.medium,
            ),
            40.ESH(),
            PinCodeServices.pinCodeWidget(
                context: context,
                pinCodeController: _.pinCodeController,
                errorController: _.errorController),
            40.ESH(),
            const Spacer(),
            ButtonDefault.main(
              title: 'Continue',
              onTap: () {
                _.checkCode();
                // Get.back();
                // Get.bottomSheet(
                // BottomSheetResetPassword(),
                //   isScrollControlled: true,
                // );
              },
            ),
            33.ESH(),
          ]),
        ),
      ),
    );
  }
}
