import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/AuthFeature/EditGeneralProfile/Bloc/model/account_details_model.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/services/svg_widget.dart';
import 'package:querium/src/core/utils/extensions.dart';

class ListPersonalData extends StatelessWidget {
  final AccountDetailsModel accountDetailsModel;
  const ListPersonalData({
    super.key,
    required this.accountDetailsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PersonalData(
            icon: 'profile', label: 'label', data: accountDetailsModel.name),
        const Divider(
          color: AppColors.dividerGrayD0,
          height: 0,
          thickness: 0.5,
        ),
      ],
    );
  }
}

class PersonalData extends StatelessWidget {
  final String icon;
  final String label;
  final String data;

  const PersonalData({
    super.key,
    required this.icon,
    required this.label,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: Get.width,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconSvg(icon),
            9.ESW(),
            CustomTextL.title(
              label,
              fontSize: 14,
              color: AppColors.titleGray54,
            ),
            const Spacer(),
            CustomTextR(
              data,
            ),
          ],
        ),
      ),
    );
  }
}
