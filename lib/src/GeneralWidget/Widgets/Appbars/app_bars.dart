import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/GeneralWidget/Widgets/Cards/card_avatar_image.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/utils/extensions.dart';
import 'package:querium/src/core/utils/storage_util.dart';

import '../../../core/services/svg_widget.dart';

class AppBars {
  static AppBar appBarDefault({
    bool isBack = true,
    bool bottomDivider = false,
    TabBar? tabBar,
    String title = '',
    VoidCallback? onTapBack,
    Color backgroundColor = AppColors.transparentColor,
    Widget secondIconImage = const SizedBox(
      width: 0,
    ),
    VoidCallback? onTap,
    Color? iconcolor,
    Color? titleColor,
  }) {
    return AppBar(
      title: CustomTextL(
        title.tr,
        fontWeight: FW.bold,
        fontSize: 32,
        textAlign: TextAlign.start,
        color: titleColor,
      ),
      titleSpacing: 8.w,
      backgroundColor: backgroundColor,
      centerTitle: true,
      elevation: 0.0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          color: AppColors.dividerGrayD0,
          height: bottomDivider ? 0.5 : 0.0,
        ),
      ),
      leading: isBack == false
          ? 0.0.ESH()
          : IconButton(
              onPressed: () => Get.back(),
              icon: const IconSvg(
                'arrow-back',
              ),
            ),
      actions: [secondIconImage],
    );
  }

  static AppBar appBarBack({
    bool isBack = true,
    TabBar? tabBar,
    String title = '',
    VoidCallback? onTapBack,
    Color backgroundColor = AppColors.transparentColor,
    Widget secondIconImage = const SizedBox(
      width: 0,
    ),
    VoidCallback? onTap,
    Color? iconcolor,
    Color? titleColor,
  }) {
    return AppBar(
      scrolledUnderElevation: 0,
      title: CustomTextL(
        title.tr,
        fontWeight: FW.bold,
        fontSize: 32,
        textAlign: TextAlign.center,
        color: titleColor,
      ),
      titleSpacing: 8.w,
      backgroundColor: backgroundColor,
      centerTitle: true,
      elevation: 0.0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          color: AppColors.dividerGrayD0,
        ),
      ),
      leading: isBack == false
          ? 0.0.ESH()
          : IconButton(
              onPressed: () => Get.back(),
              icon: IconSvg(
                'Back',
                boxFit: BoxFit.fill,
                height: 28.h,
                width: 15.w,
              ),
            ),
      actions: [secondIconImage],
    );
  }

  static AppBar appBarCompany({
    bool isBack = true,
    TabBar? tabBar,
    String title = '',
    VoidCallback? onTapBack,
    Color backgroundColor = AppColors.transparentColor,
    Widget secondIconImage = const SizedBox(
      width: 0,
    ),
    VoidCallback? onTap,
    Color? iconcolor,
    Color? titleColor,
  }) {
    return AppBar(
      title: CustomTextL(
        title.tr,
        fontWeight: FW.bold,
        fontSize: 16,
        textAlign: TextAlign.start,
        color: titleColor,
      ),
      titleSpacing: 8.w,
      backgroundColor: backgroundColor,
      centerTitle: true,
      elevation: 0.0,
      leading: isBack == false
          ? 0.0.ESH()
          : IconButton(
              onPressed: () => Get.back(),
              icon: Container(
                height: 32.h,
                width: 32.w,
                decoration: BoxDecoration(
                  color: AppColors.iconBlack.withOpacity(0.50),
                  shape: BoxShape.circle,
                ),
                child: const IconSvg(
                  'back',
                  size: 15,
                ),
              ),
            ),
      actions: [secondIconImage],
      bottom: tabBar,
    );
  }

  static AppBar appBarMyPoints({
    bool isBack = true,
    TabBar? tabBar,
    String title = '',
    VoidCallback? onTapBack,
    Color backgroundColor = AppColors.transparentColor,
    Widget secondIconImage = const SizedBox(
      width: 0,
    ),
    VoidCallback? onTap,
    Color? iconcolor,
    Color? titleColor,
  }) {
    return AppBar(
      title: CustomTextL(
        title.tr,
        fontWeight: FW.bold,
        fontSize: 16,
        textAlign: TextAlign.start,
        color: titleColor,
      ),
      titleSpacing: 8.w,
      backgroundColor: backgroundColor,
      centerTitle: true,
      elevation: 0.0,
      leading: isBack == false
          ? 0.0.ESH()
          : IconButton(
              onPressed: () => Get.back(),
              icon: Container(
                height: 42.h,
                width: 42.w,
                decoration: BoxDecoration(
                  color: AppColors.backGroundIconWhite.withOpacity(0.07),
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(555.r),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: const IconSvg(
                      'arrow-back',
                      size: 15,
                      color: AppColors.iconWight,
                    ),
                  ),
                ),
              ),
            ),
      actions: [secondIconImage],
      bottom: tabBar,
    );
  }

  static AppBar appBarEditProfile({
    bool isBack = true,
    TabBar? tabBar,
    String title = '',
    VoidCallback? onTapBack,
    Color backgroundColor = AppColors.transparentColor,
    Widget secondIconImage = const CustomTextL(
      padding: EdgeInsetsDirectional.only(end: 16),
      "save",
      color: AppColors.titleGold,
      fontSize: 13,
    ),
    VoidCallback? onTap,
    Color? iconcolor,
    Color? titleColor,
  }) {
    return AppBar(
      title: CustomTextL(
        title.tr,
        fontWeight: FW.bold,
        fontSize: 16,
        textAlign: TextAlign.start,
        color: titleColor,
      ),
      titleSpacing: 8.w,
      backgroundColor: backgroundColor,
      centerTitle: true,
      elevation: 0.0,
      // Remove the default shadow
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          color: AppColors.dividerGrayD0,
          height: 0.5,
        ),
      ),
      leading: isBack == false
          ? 0.0.ESH()
          : IconButton(
              onPressed: () => Get.back(),
              icon: const IconSvg(
                'back',
                size: 20,
                color: AppColors.iconGray29,
                boxFit: BoxFit.fill,
              ),
            ),
      actions: [secondIconImage],
    );
  }

  static AppBar appBarSkipDefault(
      {bool isBack = true,
      TabBar? tabBar,
      String title = '',
      Widget secondIconImage = const SizedBox(
        width: 0,
      ),
      VoidCallback? onTapBack,
      VoidCallback? onTapSkip,
      bool isSkip = false}) {
    return AppBar(
      title: CustomTextL(
        title,
        fontWeight: FW.medium,
        fontSize: 16,
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      leading: isBack == false ? 0.0.ESH() : CustomIconBack(onTap: onTapBack),
      actions: [
        isSkip == true
            ? SizedBox(
                width: 60.w,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: onTapSkip,
                  icon: const CustomTextL(
                    "skip_",
                    fontWeight: FW.medium,
                    fontSize: 12,
                  ),
                ),
              )
            : 0.0.ESH()
      ],
      bottom: tabBar,
    );
  }

  static AppBar appBarHome({
    required int bNBIndex,
    required bool withWallet,
  }) {
    return AppBar(
      scrolledUnderElevation: 0,
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              withWallet
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextL(
                          "good_morning".tr,
                          fontSize: 12,
                          color: AppColors.titleGreyC1,
                          fontWeight: FW.medium,
                        ),
                        const CustomTextR(
                          'احمد دومة 👋',
                          color: AppColors.titleGreyC1,
                          fontWeight: FW.medium,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextL(
                          "good_morning".tr,
                          fontSize: 12,
                          fontWeight: FW.medium,
                        ),
                        const CustomTextR(
                          'احمد دومة',
                          fontWeight: FW.medium,
                        ),
                        Image.asset(
                          'assets/images/wave.png',
                          width: 15.w,
                          height: 18.h,
                        ),
                      ],
                    ),
              withWallet
                  ? const CustomTextR(
                      'الثلاثاء. 28 مايو. 2024',
                      fontSize: 14,
                      fontWeight: FW.bold,
                      color: AppColors.titleWhite,
                    )
                  : const CustomTextR(
                      'الثلاثاء. 28 مايو. 2024',
                      fontSize: 14,
                      fontWeight: FW.bold,
                    ),
            ],
          ),
        ],
      ),
      leading: IconButton(
        icon: withWallet!
            ? Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lineGreen),
                    shape: BoxShape.circle),
                child: CardAvatarImage(
                    size: 40,
                    image: LocalStorageCubit().getItem(
                          key: 'avatar',
                        ) ??
                        ''),
              )
            : CardAvatarImage(
                size: 40,
                image: LocalStorageCubit().getItem(
                      key: 'avatar',
                    ) ??
                    ''),
        tooltip: 'Open Profile',
        onPressed: () {},
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: [
        if (bNBIndex == 0)
          Center(
              child: withWallet!
                  ? const NotificationWidget(
                      glassy: true,
                    )
                  : const NotificationWidget(
                      glassy: false,
                    )),
      ],
    );
  }

  static AppBar appBarInvestmentPortfolio({
    required int bNBIndex,
  }) {
    return AppBar(
      scrolledUnderElevation: 0,
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextL(
                    "good_morning".tr,
                    fontSize: 12,
                    color: AppColors.titleWhite,
                  ),
                  const CustomTextR(
                    'احمد دومة',
                    color: AppColors.titleWhite,
                  ),
                ],
              ),
              CustomTextL(
                "trade_your_points_with_us_now".tr,
                color: AppColors.titleWhite,
              ),
            ],
          ),
        ],
      ),
      leading: IconButton(
        icon: CardAvatarImage(
            size: 40,
            image: LocalStorageCubit().getItem(
                  key: 'avatar',
                ) ??
                ''),
        tooltip: 'Open Profile',
        onPressed: () {},
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: [
        if (bNBIndex == 0 || bNBIndex == 1)
          const Center(
            child: NotificationWidget(
              glassy: true,
              endPadding: 0,
            ),
          ),
        IconButton(
          onPressed: () {},
          icon: Padding(
            padding: EdgeInsetsDirectional.only(end: 0.w),
            child: SizedBox(
              width: 40.w,
              height: 40.h,
              child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.backGroundIconGreyF5.withOpacity(0.10),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: IconSvg(
                        'search',
                        color: Colors.white,
                        size: 18,
                        boxFit: BoxFit.fill,
                      ),
                    ),
                  )),
            ),
          ),
        )
      ],
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.glassy,
    this.endPadding = 16,
  });
  final double? endPadding;
  final bool glassy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: endPadding!),
      child: SizedBox(
        width: 40.w,
        height: 40.h,
        child: InkWell(
          onTap: () {},
          child: Stack(
            children: [
              glassy
                  ? Container(
                      decoration: BoxDecoration(
                        color: AppColors.backGroundIconGreyF5.withOpacity(0.10),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                          child: IconSvg(
                        'notification',
                        color: Colors.white,
                      )),
                    )
                  : Container(
                      decoration: const BoxDecoration(
                        color: AppColors.backGroundIconGreyF5,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(child: IconSvg('notification')),
                    ),
              Visibility(
                visible: true,
                child: Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundColor: AppColors.titleRedFF,
                    radius: 5.r,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomIconBack extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? iconcolor;

  const CustomIconBack({
    super.key,
    this.onTap,
    this.iconcolor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: onTap ??
          () {
            Get.back();
          },
      icon: IconSvg(
        'arrow-back',
        size: 24,
        color: iconcolor,
      ),
    );
  }
}
