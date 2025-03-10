import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Controller/register_controller.dart';
import 'package:querium/src/Features/AuthFeature/Verification/Ui/Screens/verification_account_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/StaggeredAnimations/base_column.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/TextFields/text_field_default.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';
import 'package:querium/src/core/utils/validator.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (_) => BaseScaffold(
        body: Form(
          key: _.registerGlobalKey,
          child: Padding(
            padding: AppPadding.paddingScreenSH36,
            child: BaseStaggeredColumn(
              children: [
                160.ESH(),
                const CustomTextL('Join us to start', fontWeight: FW.bold),
                85.ESH(),
                TextFieldDefault(
                  label: 'Name',
                  controller: _.nameController,
                  validation: nameValidator,
                  onComplete: () {
                    node.nextFocus();
                  },
                ),
                24.ESH(),
                TextFieldDefault(
                  label: 'Email',
                  controller: _.emailController,
                  validation: emailValidator,
                  keyboardType: TextInputType.emailAddress,
                  onComplete: () {
                    node.nextFocus();
                  },
                ),
                24.ESH(),
                TextFieldDefault(
                  label: 'Password',
                  controller: _.passwordController,
                  validation: passwordValidator,
                  secureType: SecureType.toggle,
                  onComplete: () {
                    node.nextFocus();
                  },
                ),
                24.ESH(),
                TextFieldDefault(
                  label: 'Confirm Password',
                  controller: _.confirmPasswordController,
                  validation: (value) {
                    return confirmPasswordValidator(
                        value, _.passwordController.text);
                  },
                  secureType: SecureType.toggle,
                  onComplete: () {
                    node.nextFocus();
                  },
                ),
                24.ESH(),
                TextFieldDefault(
                  label: 'ID',
                  controller: _.idController,
                  validation: idValidator,
                  keyboardType: TextInputType.number,
                  maxLength: 5,
                  onComplete: () {
                    node.nextFocus();
                  },
                ),
                24.ESH(),
                TextFieldDefault(
                  label: 'National ID',
                  controller: _.nationalIdController,
                  validation: nationalIdValidator,
                  keyboardType: TextInputType.number,
                  maxLength: 16,
                  onComplete: () {
                    node.unfocus();
                    _.createAccount();
                  },
                ),
                50.ESH(),
                ButtonDefault.main(
                  onTap: () {
                    Get.to(
                        VerificationAccountScreen(token: '1', email: 'email'));
                    _.createAccount();
                  },
                  title: 'Sign up',
                ),
                _LoginWidget(
                  controller: _,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginWidget extends StatelessWidget {
  final RegisterController controller;

  const _LoginWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextL(
          'Have an account ?',
          fontSize: 14.sp,
          color: AppColors.main,
        ),
        TextButton(
          onPressed: () {
            controller.moveToLogIn();
          },
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: CustomTextL(
            decoration: CustomTextDecoration.underLine,
            'Log in',
            fontSize: 14.sp,
            fontWeight: FW.medium,
            color: AppColors.main,
          ),
        ),
      ],
    );
  }
}
