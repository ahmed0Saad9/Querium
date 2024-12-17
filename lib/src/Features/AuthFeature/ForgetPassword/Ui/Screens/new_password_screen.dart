import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Bloc/Controller/forget_password_controller.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/utils/extensions.dart';

import '../../../../../GeneralWidget/Widgets/Text/custom_text.dart';
import '../../../../../GeneralWidget/Widgets/TextFields/text_field_default.dart';
import '../../../../../core/constants/color_constants.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/services/svg_widget.dart';
import '../../../../../core/utils/validator.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBars.appBarDefault(),
      body: Padding(
        padding: AppPadding.paddingScreenSH16,
        child: Form(
          child: GetBuilder<ForgetPasswordController>(
            builder: (_) => Form(
              // key: _.resetPasswordGlobalKey,
              child: ListView(
                children: [
                  Column(
                    children: [
                      16.ESH(),
                      Row(
                        children: [
                          const CustomTextL(
                            'ادخل كلمة المرور الجديدة',
                            fontSize: 18,
                            fontWeight: FW.bold,
                            color: AppColors.titleBlack1A,
                          ),
                          8.ESW(),
                          IconSvg(
                            'new_password',
                            width: 28.w,
                            height: 28.h,
                          ),
                        ],
                      ),
                      const CustomTextL(
                        'احفظ كلمة المرور الجديدة في مكان آمن، إذا نسيتها، عليك أن تفعل كلمة المرور المنسية مرة أخرى.',
                        textAlign: TextAlign.right,
                        fontSize: 14,
                        fontWeight: FW.medium,
                        color: AppColors.titleGray65,
                      ),
                    ],
                  ),
                  36.ESH(),
                  TextFieldDefault(
                    upperTitle: 'كلمة المرور',
                    upperTitleColor: AppColors.titleBlack0B,
                    hint: 'كلمة المرور',
                    controller: _.passwordController,
                    prefixIconWidget: const IconSvg('lock'),
                    validation: passwordValidator,
                    secureType: SecureType.toggle,
                    outerVerticalPadding: 0,
                  ),
                  // const Column(
                  //   children: [
                  //     PasswordCheck(
                  //       label: 'من 8 الي 20 حرف',
                  //     ),
                  //     PasswordCheck(
                  //       label: 'علي الاقل حرف كبير و حرف صغير',
                  //     ),
                  //     PasswordCheck(
                  //       label: 'علي الاقل رمز واحد خاص',
                  //     ),
                  //     PasswordCheck(
                  //       label: 'علي الاقل رقم واحد',
                  //     ),
                  //   ],
                  // ),
                  24.ESH(),
                  TextFieldDefault(
                    upperTitle: 'تأكيد كلمة المرور',
                    hint: 'تأكيد كلمة المرور',
                    prefixIconWidget: IconSvg('lock'),
                    controller: _.confirmPasswordController,
                    secureType: SecureType.toggle,
                    outerVerticalPadding: 0,
                    validation: (value) {
                      return confirmPasswordValidator(
                          value, _.passwordController.text);
                    },
                  ),
                  // const PasswordCheck(label: 'يجب ان تكون كلمتا المرور متطابقان'),
                  153.ESH(),
                  ButtonDefault.main(
                    title: 'حفظ التغييرات',
                    onTap: () {
                      _.validateOtpAndChangePassword();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordCheck extends StatelessWidget {
  const PasswordCheck({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          const IconSvg('check'),
          CustomTextL(
            label,
            color: AppColors.titleGrayAF,
            fontSize: 12,
            textAlign: TextAlign.right,
          )
        ],
      ),
    );
  }
}
