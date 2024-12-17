import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Bloc/Controller/change_password_controller.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Screens/forget_password_screen.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Widgets/change_password_body.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/custom_stepper.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/data_success_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/top_custom_container.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: GetBuilder<ChangePasswordController>(
        init: ChangePasswordController(),
        builder: (_) => ListView(
          padding: EdgeInsets.zero,
          children: [
            const TopCustomContainer(
                icon: 'password',
                title: 'change_password',
                subTitle:
                    'please_enter_your_old_password_to_create_a_new_password'),
            _.passwordChanged
                ? const DataSuccessScreen(
                    image: 'assets/images/PasswordResetSuccessful.png',
                    title: 'Password_changed_successfully',
                    subTitle: '')
                : const ChangePasswordBody(),
            const Spacer(),
            _.passwordChanged
                ? 0.0.ESH()
                : Container(
                    color: AppColors.backGroundGreyFD,
                    child: Column(
                      children: [
                        const MainDivider(
                          thickness: 8,
                        ),
                        ButtonDefault.main(
                          onTap: () => _.passwordChangedSuccessfully(),
                          title: 'change_password',
                          horizontalPadding: 16,
                        ),
                        TextButton(
                          onPressed: () =>
                              Get.to(() => const ForgetPasswordScreen()),
                          child: const CustomTextL('Forget_Password',
                              color: AppColors.titleGreen,
                              fontSize: 16,
                              fontWeight: FW.bold,
                              decoration: CustomTextDecoration.underLine),
                        ),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
// _.dataModifiedSuccessfully
// ? Padding(
// padding: AppPadding.paddingScreenSH20SV20,
// child: const DataSuccessScreen(
// image: 'assets/images/DataModifiedSuccefully.png',
// title: 'data_has_been_modified_successfully',
// subTitle: ''),
// )
//     : EditProfileTFBody(
// controller: _,
// ),
// _.dataModifiedSuccessfully
// ? 0.0.ESH()
//     : Column(
// children: [
// const MainDivider(
// thickness: 8,
// ),
// ButtonDefault.main(
// title: 'confirm',
// onTap: () => _.modifiesData(),
// horizontalPadding: 16,
// ),
