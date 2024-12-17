import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Bloc/Controller/forget_password_controller.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Screens/bottomsheet_reset_password.dart';
import 'package:querium/src/GeneralWidget/Widgets/BottomSheets/base_bottom_sheet.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/TextFields/text_field_default.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/services/pin_code.dart';
import 'package:querium/src/core/services/pin_code.dart';
import 'package:querium/src/core/utils/extensions.dart';
import 'package:querium/src/core/utils/validator.dart';

class BottomSheetSendOTP extends StatelessWidget {
  BottomSheetSendOTP({
    super.key,
  });

  ForgetPasswordController controller = Get.put(ForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);

    return BaseBottomSheet(
      height: Get.height * 0.6,
      widget: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            pinCodeController: controller.pinCodeController,
            errorController: controller.errorController),
        40.ESH(),
        const Spacer(),
        ButtonDefault.main(
          title: 'Continue',
          onTap: () {
            Get.back();
            Get.bottomSheet(
              BottomSheetResetPassword(),
              isScrollControlled: true,
            );
          },
        ),
        33.ESH(),
      ]),
    );
  }
}
