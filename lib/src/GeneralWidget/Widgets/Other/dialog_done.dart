import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/utils/extensions.dart';

class DialogDone extends StatelessWidget {
  const DialogDone({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/3d_checkMark.png',
                height: 100.h, width: 100.w, fit: BoxFit.fill),
            29.ESH(),
            CustomTextL(
              "your_vote_added_successfully",
              color: AppColors.titleBlack10,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
