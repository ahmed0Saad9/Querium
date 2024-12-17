import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:querium/src/core/utils/extensions.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/services/svg_widget.dart';
import '../Text/custom_text.dart';

class BaseIconWidget extends StatelessWidget {
  final String selectedIcon;
  final String title;
  final VoidCallback onTap;
  final bool active;

  const BaseIconWidget({
    super.key,
    required this.onTap,
    this.active = false,
    required this.selectedIcon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: IconSvg(
                selectedIcon,
                size: 24,
                color: active ? AppColors.main : AppColors.iconGray95,
                boxFit: BoxFit.fill,
              ),
            ),
            6.ESH(),
            CustomTextL(
              title,
              color: active ? AppColors.titleGold : AppColors.secondary,
              fontWeight: FW.medium,
              fontSize: 12,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
