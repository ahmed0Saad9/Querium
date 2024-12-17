import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

class CardAccountType extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final bool isActive;
  final VoidCallback? onTap;

  const CardAccountType({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.paddingScreenSH16,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: AppPadding.paddingScreenSH16SV16,
          decoration: BoxDecoration(
              color: isActive ? AppColors.main : AppColors.transparentColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: isActive
                      ? AppColors.borderGreen
                      : AppColors.borderGreyE5)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextL.title(
                      title,
                    ),
                    4.ESH(),
                    CustomTextL.subtitle(subTitle),
                  ],
                ),
              ),
              10.ESW(),
              Image.asset(
                image,
                height: 75.h,
                width: 75.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
