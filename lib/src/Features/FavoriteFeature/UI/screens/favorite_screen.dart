import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:querium/src/Features/HomeFeature/UI/screens/chapters_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/utils/extensions.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBars.appBarBack(title: 'Favorite', isBack: false),
      backgroundColor: AppColors.backGroundGreyF4,
      body: ListView.separated(
          itemBuilder: (context, index) => const ChaptersCard(),
          separatorBuilder: (context, index) => 16.ESH(),
          padding:
              EdgeInsets.only(right: 36.w, left: 36.w, top: 40.h, bottom: 16.h),
          itemCount: 7),
    );
    ();
  }
}
