import 'package:flutter/material.dart';
import 'package:querium/src/Features/AuthFeature/Verification/Ui/widgets/pin_field_widget.dart';
import 'package:querium/src/Features/AuthFeature/Verification/Ui/widgets/verification_top_widget.dart';
import 'package:querium/src/GeneralWidget/Widgets/StaggeredAnimations/base_column.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';

import '/src/core/utils/extensions.dart';
import '../../../Register/Bloc/Controller/register_controller.dart';

class VerificationAccountScreen extends StatelessWidget {
  final RegisterController controller;
  // final String token;

  const VerificationAccountScreen({
    super.key,
    required this.controller,
    // required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.backGroundGreyFD,
        padding: AppPadding.paddingScreenSH16,
        height: double.infinity,
        width: double.infinity,
        child: BaseStaggeredColumn(
          children: [
            VerificationTopWidget(
              title: 'verify_your_account',
              phone: controller.emailController.text,
            ),
            14.ESH(),
            PinFieldWidget(
              phone: controller.emailController.text,
            ),
            16.ESH(),
            ButtonDefault.main(
              title: 'confirm',
              verticalPadding: 16,
            ),
          ],
        ),
      ),
    );
  }
}
