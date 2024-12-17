import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Bloc/Controller/forget_password_controller.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Screens/Pin_via_message_screen.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Screens/pin_via_email_screen.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Widgets/forget_password_body.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/top_custom_container.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/custom_stepper.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/utils/extensions.dart';

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
      body: GetBuilder<ForgetPasswordController>(
        builder: (_) => Form(
          key: _.globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TopCustomContainer(
                icon: 'forget_password',
                title: 'Forget_Password',
                subTitle:
                    'specify_the_contact_details_we_should_use_to_reset_your_password',
              ),
              ForgetPasswordBody(controller: _),
              // const Spacer(),
              8.ESH(),
              Container(
                color: AppColors.backGroundGreyFD,
                child: Column(
                  children: [
                    22.ESH(),
                    ButtonDefault.main(
                      title: "confirm",
                      onTap: () {
                        if (_.message == true) {
                          Get.to(() => const PINViaMessageScreen());
                        } else {
                          Get.to(() => const PINViaEmailScreen());
                        }
                        // _.sendOtp();
                      },
                      horizontalPadding: 16,
                    ),
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const CustomTextL(
                        'I_remembered_my_password',
                        color: AppColors.titleGreen,
                        fontSize: 16,
                        fontWeight: FW.bold,
                        decoration: CustomTextDecoration.underLine,
                      ),
                    ),
                    4.ESH(),
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
