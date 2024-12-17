import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Bloc/Controller/forget_password_controller.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Widgets/bottom_resend_code.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/StaggeredAnimations/base_column.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/services/pin_code.dart';
import 'package:querium/src/core/utils/extensions.dart';

class PinCodeScreen extends StatelessWidget {
  final String title;

  const PinCodeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.appBarDefault(title: title),
      body: GetBuilder<ForgetPasswordController>(
        builder: (_) => SizedBox(
          width: Get.width,
          child: BaseStaggeredColumn(
            children: [
              68.ESH(),
              const CustomTextL(
                'برجاء',
                fontSize: 20,
                fontWeight: FW.bold,
                color: AppColors.titleBlack0B,
              ),
              const CustomTextL(
                'أدخل ال OTP الذي تم ارساله',
                fontSize: 20,
                fontWeight: FW.bold,
              ),
              100.ESH(),
              PinCodeWidget(
                context: context,
                pinCodeController: _.pinCodeController,
                errorController: _.errorController,
              ),
              ResendButton(
                resendCode: () {
                  _.sendOtp(isResendCode: true);
                },
              ),
              60.ESH(),
              ButtonDefault.main(
                title: 'continue',
                onTap: () {
                  _.checkCode();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
