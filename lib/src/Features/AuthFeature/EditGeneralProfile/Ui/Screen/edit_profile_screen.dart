import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/AuthFeature/EditGeneralProfile/Bloc/Controller/edit_general_profile_controller.dart';
import 'package:querium/src/Features/AuthFeature/EditGeneralProfile/Ui/Widgets/edit_profile_TF_body.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/custom_stepper.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/data_success_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/top_custom_container.dart';
import 'package:querium/src/GeneralWidget/Widgets/StaggeredAnimations/base_column.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
      init: EditProfileController(),
      builder: (_) => BaseScaffold(
        backgroundColor: Colors.white,
        body: BaseStaggeredColumn(
          children: [
            const TopCustomContainer(
                icon: 'EditAccount',
                title: 'edit_account',
                subTitle: 'you_can_modify_your_account_personal_data'),
            _.dataModifiedSuccessfully
                ? Padding(
                    padding: AppPadding.paddingScreenSH20SV20,
                    child: const DataSuccessScreen(
                        image: 'assets/images/DataModifiedSuccefully.png',
                        title: 'data_has_been_modified_successfully',
                        subTitle: ''),
                  )
                : EditProfileTFBody(
                    controller: _,
                  ),
            _.dataModifiedSuccessfully
                ? 0.0.ESH()
                : Column(
                    children: [
                      const MainDivider(
                        thickness: 8,
                      ),
                      ButtonDefault.main(
                        title: 'confirm',
                        onTap: () => _.modifiesData(),
                        horizontalPadding: 16,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
