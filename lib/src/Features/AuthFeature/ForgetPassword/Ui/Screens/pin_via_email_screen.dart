import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Bloc/Controller/forget_password_controller.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Screens/reset_password_screen.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Widgets/pin_via_email_body.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/top_custom_container.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/custom_stepper.dart';
import 'package:querium/src/GeneralWidget/Widgets/StaggeredAnimations/base_column.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/utils/extensions.dart';

class PINViaEmailScreen extends StatefulWidget {
  const PINViaEmailScreen({super.key});

  @override
  State<PINViaEmailScreen> createState() => _PINViaEmailScreenState();
}

class _PINViaEmailScreenState extends State<PINViaEmailScreen> {
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
              30.ESH(),
              const TopCustomContainer(
                icon: 'forget_password',
                title: 'Forget_Password',
                subTitle:
                    'specify_the_contact_details_we_should_use_to_reset_your_password',
              ),
              PINViaEmailBody(controller: _),
              const Spacer(),
              8.ESH(),
              Container(
                color: AppColors.backGroundGreyFD,
                child: ButtonDefault.main(
                  title: "confirm",
                  // onTap: () => _.checkCode(),
                  onTap: () => Get.to(() => const ResetPasswordScreen()),
                  horizontalPadding: 16.w,
                  verticalPadding: 16.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
