import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Bloc/Controller/forget_password_controller.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Screens/password_reset_succesful_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/top_custom_container.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/custom_stepper.dart';
import 'package:querium/src/GeneralWidget/Widgets/StaggeredAnimations/base_column.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/TextFields/text_field_default.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';
import 'package:querium/src/core/utils/validator.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController());
    var node = FocusScope.of(context);
    return BaseScaffold(
      body: GetBuilder<ForgetPasswordController>(
        builder: (_) => Form(
          key: _.resetPasswordGlobalKey,
          child: BaseStaggeredColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopCustomContainer(
                icon: 'forget_password',
                title: 'Forget_Password',
                subTitle:
                    'specify_the_contact_details_we_should_use_to_reset_your_password',
              ),
              Container(
                color: AppColors.backGroundGreyFD,
                child: Column(
                  children: [
                    Image.asset('assets/images/ResetPassword.png'),
                    14.ESH(),
                    CustomTextL.title(
                      'change_password',
                      padding: AppPadding.paddingScreenSH16,
                    ),
                    14.ESH(),
                    TextFieldDefault(
                      hint: "password",
                      prefixIconUrl: 'password',
                      controller: _.passwordController,
                      validation: passwordValidator,
                      secureType: SecureType.always,
                      outerHorizontalPadding: 16.w,
                    ),
                    14.ESH(),
                    TextFieldDefault(
                      hint: "Confirm_Password",
                      prefixIconUrl: 'password',
                      controller: _.confirmPasswordController,
                      validation: (value) {
                        return confirmPasswordValidator(
                            value, _.passwordController.text);
                      },
                      secureType: SecureType.always,
                      outerHorizontalPadding: 16.w,
                    ),
                    120.ESH(),
                    const MainDivider(
                      thickness: 8,
                    ),
                    ButtonDefault.main(
                      title: 'confirm',
                      horizontalPadding: 16.w,
                      verticalPadding: 16.h,
                      onTap: () =>
                          Get.to(() => const PasswordResetSuccessfulScreen()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
