import 'package:flutter/material.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/top_custom_container.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/data_success_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/StaggeredAnimations/base_column.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

class PasswordResetSuccessfulScreen extends StatelessWidget {
  const PasswordResetSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: BaseStaggeredColumn(
        children: [
          const TopCustomContainer(
            icon: 'forget_password',
            title: 'Forget_Password',
            subTitle:
                'specify_the_contact_details_we_should_use_to_reset_your_password',
          ),

          Padding(
            padding: AppPadding.paddingScreenSH16,
            child: DataSuccessScreen(
                image: 'assets/images/PasswordResetSuccessful.png',
                title: 'Password_changed_successfully',
                subTitle: ''),
          )
        ],
      ),
    );
  }
}
