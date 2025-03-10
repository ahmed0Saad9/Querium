import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Bloc/Controller/forget_password_controller.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Screens/pin_code.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Widgets/forget_password_body.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/top_custom_container.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/custom_stepper.dart';
import 'package:querium/src/GeneralWidget/Widgets/TextFields/text_field_default.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';
import 'package:querium/src/core/utils/validator.dart';

import '../../../../../GeneralWidget/Widgets/Text/custom_text.dart';
import '../../../../../core/constants/color_constants.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<ForgetPasswordController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController());
    var node = FocusScope.of(context);
    return BaseScaffold(
        appBar: AppBars.appBarBack(title: 'Forget password'),
        body: GetBuilder<ForgetPasswordController>(
          init: ForgetPasswordController(),
          builder: (_) => Form(
            key: _.globalKey,
            child: Padding(
              padding: AppPadding.paddingScreenSH36,
              child: Column(children: [
                30.ESH(),
                CustomTextL.subtitle(
                  'Enter your email for the verification process,\nwe will send 4 digits code to your email.',
                  fontWeight: FW.medium,
                  textAlign: TextAlign.center,
                ),
                40.ESH(),
                TextFieldDefault(
                  label: 'Email',
                  controller: _.emailController,
                  validation: emailValidator,
                  keyboardType: TextInputType.emailAddress,
                  onComplete: () {
                    node.unfocus();
                  },
                ),
                const Spacer(),
                ButtonDefault.main(
                  title: 'Continue',
                  onTap: () {
                    Get.to(
                      () => const PinCodeScreen(
                        title: 'OTP',
                      ),
                    );
                    _.checkEmailAndSendOtp();
                    // Get.bottomSheet(BottomSheetSendOTP(), isScrollControlled: true);
                  },
                ),
                33.ESH(),
              ]),
            ),
          ),
        ));
  }
}
