import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:querium/src/Features/AuthFeature/ForgetPassword/Bloc/Controller/forget_password_controller.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/StaggeredAnimations/base_column.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/TextFields/text_field_default.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/services/svg_widget.dart';
import 'package:querium/src/core/utils/extensions.dart';
import 'package:querium/src/core/utils/validator.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController());
    var node = FocusScope.of(context);
    return BaseScaffold(
      appBar: AppBars.appBarBack(title: "Reset_Password"),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: AppPadding.paddingScreenSH36,
          child: GetBuilder<ForgetPasswordController>(
            builder: (_) => Form(
              key: _.resetPasswordGlobalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  24.ESH(),
                  TextFieldDefault(
                    label: "current_Password",
                    validation: passwordValidator,
                    controller: _.currentPasswordController,
                    secureType: SecureType.toggle,
                  ),
                  24.ESH(),
                  TextFieldDefault(
                    label: "new_Password",
                    validation: passwordValidator,
                    controller: _.passwordController,
                    secureType: SecureType.toggle,
                  ),
                  24.ESH(),
                  TextFieldDefault(
                    label: "Confirm_New_Password",
                    validation: passwordValidator,
                    controller: _.confirmPasswordController,
                    secureType: SecureType.toggle,
                  ),
                  Spacer(),
                  ButtonDefault.main(
                    title: 'Confirm',
                    active: _.currentPasswordController.text.isNotEmpty &&
                        _.passwordController.text.isNotEmpty &&
                        _.confirmPasswordController.text.isNotEmpty,
                  ),
                  24.ESH(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
