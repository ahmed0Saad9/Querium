import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Bloc/Controller/forget_password_controller.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Screens/reset_password_screen.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Widgets/pin_via_message_body.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/top_custom_container.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/custom_stepper.dart';
import 'package:querium/src/GeneralWidget/Widgets/StaggeredAnimations/base_column.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

class PINViaMessageScreen extends StatefulWidget {
  const PINViaMessageScreen({super.key});

  @override
  State<PINViaMessageScreen> createState() => _PINViaMessageScreenState();
}

class _PINViaMessageScreenState extends State<PINViaMessageScreen> {
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
          // key: _.globalKey,
          child: BaseStaggeredColumn(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TopCustomContainer(
                icon: 'forget_password',
                title: 'Forget_Password',
                subTitle:
                    'specify_the_contact_details_we_should_use_to_reset_your_password',
              ),
              PINViaMessageBody(controller: _),
              const Spacer(),
              // const MainDivider(thickness: 8),
              8.ESH(),
              Container(
                color: AppColors.backGroundGreyFD,
                child: ButtonDefault.main(
                  title: "confirm",
                  // onTap: () => _.checkCode(),
                  onTap: () => Get.to(() => const ResetPasswordScreen()),
                  horizontalPadding: 16,
                  verticalPadding: 16,
                ),
              ),
              16.ESH(),
            ],
          ),
        ),
      ),
    );
  }
}
