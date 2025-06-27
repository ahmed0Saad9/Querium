import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:querium/src/Features/BaseBNBFeature/Bloc/Controller/base_BNB_controller.dart';
import 'package:querium/src/Features/BaseBNBFeature/UI/screens/base_BNB_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

class NoFilesUploaded extends StatelessWidget {
  const NoFilesUploaded({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.paddingScreenSH36,
      child: Column(
        children: [
          100.ESH(),
          Image.asset('assets/images/NoFilesUploaded.png'),
          15.ESH(),
          const CustomTextL('No_files_uploaded', fontWeight: FW.bold),
          30.ESH(),
          GetBuilder<BaseNBNController>(
            builder: (controller) => ButtonDefault.main(
                title: 'Upload',
                onTap: () {
                  controller.updateIndex(1);
                }),
          ),
        ],
      ),
    );
  }
}
