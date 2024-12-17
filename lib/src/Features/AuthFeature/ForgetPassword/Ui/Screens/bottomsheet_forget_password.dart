import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Bloc/Controller/forget_password_controller.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Screens/bottomsheet_send_otp.dart';
import 'package:querium/src/GeneralWidget/Widgets/BottomSheets/base_bottom_sheet.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/TextFields/text_field_default.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/utils/extensions.dart';
import 'package:querium/src/core/utils/validator.dart';

class BottomSheetForgetPassword extends StatelessWidget {
  const BottomSheetForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);

    return BaseBottomSheet(
      height: Get.height * 0.6,
      widget: GetBuilder<ForgetPasswordController>(
        init: ForgetPasswordController(),
        builder: (_) =>
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomTextL(
            'Forget password',
            fontSize: 28,
            fontWeight: FW.bold,
          ),
          8.ESH(),
          CustomTextL.subtitle(
            'Enter your email for the verification process,\nwe will send 4 digits code to your email.',
            fontWeight: FW.medium,
          ),
          40.ESH(),
          TextFieldDefault(
            hint: 'Email',
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
              Get.back();
              Get.bottomSheet(BottomSheetSendOTP(), isScrollControlled: true);
            },
          ),
          33.ESH(),
        ]),
      ),
    );
  }
}
