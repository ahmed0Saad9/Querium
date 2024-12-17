import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:querium/src/Features/AuthFeature/LogIn/Ui/Screens/login_screen.dart';
import 'package:querium/src/core/utils/extensions.dart';

import '../../../../../GeneralWidget/Widgets/Other/base_scaffold.dart';
import '../../../../../GeneralWidget/Widgets/Text/custom_text.dart';
import '../../../../../GeneralWidget/Widgets/buttons/button_default.dart';

class BackToLoginScreen extends StatelessWidget {
  const BackToLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Gradiant.png',
            fit: BoxFit.fill,
            width: Get.width,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 145,
                  left: 66,
                  right: 66,
                  bottom: 57,
                ),
                child: Image.asset('assets/images/password_change.png'),
              ),
              CustomTextL.header('تم تغيير كلمة السر بنجاح'),
              15.ESH(),
              CustomTextL.subtitle(
                'لقد تم تغيير كلمة السر بنجاح قم بالذهاب الي تسجيل الدخول مرة اخري',
                padding: const EdgeInsets.symmetric(horizontal: 50),
              ),
              const Spacer(),
              ButtonDefault.main(
                title: 'العودة لتسجيل الدخول',
                onTap: () => Get.offAll(() => const LoginScreen()),
                horizontalPadding: 16,
              ),
              38.ESH(),
            ],
          )
        ],
      ),
    );
  }
}
