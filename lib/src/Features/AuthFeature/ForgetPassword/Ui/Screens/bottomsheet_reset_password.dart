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

class BottomSheetResetPassword extends StatelessWidget {
  BottomSheetResetPassword({super.key});
  ForgetPasswordController controller = Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);

    return BaseBottomSheet(
      height: Get.height * 0.6,
      widget: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomTextL(
          'Reset Password',
          fontSize: 28,
          fontWeight: FW.bold,
        ),
        8.ESH(),
        CustomTextL.subtitle(
          'Set the new password for your account so you\ncan log in and access all the features.',
          fontWeight: FW.medium,
        ),
        40.ESH(),
        TextFieldDefault(
          hint: 'New password',
          controller: controller.passwordController,
          validation: passwordValidator,
          secureType: SecureType.toggle,
          onComplete: () {
            node.nextFocus();
          },
        ),
        24.ESH(),
        TextFieldDefault(
          hint: 'Re-enter password ',
          controller: controller.confirmPasswordController,
          validation: (value) {
            return confirmPasswordValidator(
                value, controller.passwordController.text);
          },
          secureType: SecureType.toggle,
          onComplete: () {
            node.unfocus();
          },
        ),
        const Spacer(),
        ButtonDefault.main(
          title: 'Continue',
          onTap: () {
            Get.back();
          },
        ),
        33.ESH(),
      ]),
    );
  }
}
