import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/AuthFeature/LogIn/Bloc/Controller/login_controller.dart';
import 'package:querium/src/Features/AuthFeature/LogIn/Ui/Widgets/social_card.dart';
import 'package:querium/src/Features/AuthFeature/Register/Ui/Screens/register_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';

import 'package:querium/src/GeneralWidget/Widgets/StaggeredAnimations/base_column.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/TextFields/text_field_default.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/services/svg_widget.dart';
import 'package:querium/src/core/utils/validator.dart';

import '/src/core/utils/extensions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(LoginController());
    var node = FocusScope.of(context);
    return Container(
      color: AppColors.scaffoldBackGround,
      child: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) => KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) {
            return Form(
              key: _.globalKey,
              child: BaseStaggeredColumn(
                children: [
                  160.ESH(),
                  const CustomTextL('Welcome back', fontWeight: FW.bold),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              _.moveToForgetPassword();
                            },
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            child: CustomTextL(
                              'Forget password?',
                              fontSize: 14.sp,
                              fontWeight: FW.medium,
                              color: AppColors.main,
                            )),
                      ],
                    ),
                  ),
                  250.ESH(),
                  // Spacer(),
                  ButtonDefault.main(
                    onTap: () => _.navigatorToBaseBNBScreen(),
                    title: 'Log in',
                    horizontalPadding: 36.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextL(
                        'Don’t have an account?',
                        fontSize: 14.sp,
                        color: AppColors.main,
                      ),
                      TextButton(
                        onPressed: () {
                          _.moveToRegister();
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: CustomTextL(
                          decoration: CustomTextDecoration.underLine,
                          'Join us',
                          fontSize: 14.sp,
                          fontWeight: FW.medium,
                          color: AppColors.main,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
