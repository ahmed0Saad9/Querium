import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/AuthFeature/LogIn/Ui/Widgets/social_card.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Controller/register_controller.dart';
import 'package:querium/src/Features/AuthFeature/Register/Ui/Widgets/card_acount_type.dart';
import 'package:querium/src/Features/AuthFeature/Verification/Ui/Screens/verification_account_screen.dart';

import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/custom_stepper.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/data_success_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/StaggeredAnimations/base_column.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/TextFields/text_field_default.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/enums.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/services/svg_widget.dart';
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
              body: BaseStaggeredColumn(
                children: [
                  160.ESH(),
                  const CustomTextL('Join us to start', fontWeight: FW.bold),
                  85.ESH(),
                  Padding(
                    padding: AppPadding.paddingScreenSH36,
                    child: Row(
                      children: [
                        SocialCard(
                          onTap: () {},
                          title: 'Google',
                          image: 'assets/images/Google.png',
                        ),
                        const Spacer(),
                        SocialCard(
                            onTap: () {},
                            title: 'Facebook',
                            image: 'assets/images/Facebook.png'),
                      ],
                    ),
                  ),
                  32.ESH(),
                  TextFieldDefault(
                    hint: 'Name',
                    controller: _.nameController,
                    validation: emptyValidator,
                    outerHorizontalPadding: 36.w,
                    onComplete: () {
                      node.nextFocus();
                    },
                  ),
                  24.ESH(),
                  TextFieldDefault(
                    hint: 'Email',
                    controller: _.emailController,
                    validation: emailValidator,
                    keyboardType: TextInputType.emailAddress,
                    outerHorizontalPadding: 36.w,
                    onComplete: () {
                      node.nextFocus();
                    },
                  ),
                  24.ESH(),
                  TextFieldDefault(
                    hint: 'Password',
                    controller: _.passwordController,
                    validation: passwordValidator,
                    secureType: SecureType.toggle,
                    outerHorizontalPadding: 36.w,
                    onComplete: () {
                      node.unfocus();
                    },
                  ),
                  12.ESH(),
                  Padding(
                    padding: AppPadding.paddingScreenSH36,
                    child: InkWell(
                      onTap: () => _.agreeWithServices(),
                      child: Row(
                        children: [
                          Container(
                            width: 17.w,
                            height: 17.h,
                            margin: EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.secondary, width: 2)),
                            child: Container(
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _.agree
                                    ? AppColors.wight
                                    : AppColors.secondary,
                              ),
                            ),
                          ),
                          8.ESW(),
                          CustomTextL(
                            'I agree with the Terms of Service & Privacy Policy',
                            fontSize: 12.sp,
                            color: AppColors.titleSub,
                          )
                        ],
                      ),
                    ),
                  ),
                  180.ESH(),
                  ButtonDefault.main(
                    onTap: () {},
                    title: 'Sign up',
                    horizontalPadding: 36.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextL(
                        'Have an account ?',
                        fontSize: 14.sp,
                        color: AppColors.main,
                      ),
                      TextButton(
                        onPressed: () {
                          _.moveToLogIn();
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
                  )
                ],
              ),
            ));
  }
}
