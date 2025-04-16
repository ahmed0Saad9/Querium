import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:querium/src/Features/AuthFeature/LogIn/Ui/Screens/login_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

import '../../../GeneralWidget/Widgets/Other/base_scaffold.dart';
import '../bloc/model/onboarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller = PageController(keepPage: true, viewportFraction: 1);
  final controller = PageController(keepPage: true, viewportFraction: 1);
  final _itemCount = contents.length;
  bool onlastpage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        color: AppColors.scaffoldBackGround,
        padding: AppPadding.paddingScreenSH36,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                onlastpage
                    ? 65.ESH()
                    : SizedBox(
                        height: 65.h,
                        child: TextButton(
                            onPressed: () {
                              _controller.jumpToPage(2);
                            },
                            child: const CustomTextL(
                              'Skip',
                              fontWeight: FW.bold,
                            )),
                      ),
              ],
            ),
            SizedBox(
              width: Get.width,
              height: 630,
              child: PageView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    40.ESH(),
                    Image.asset(contents[index].image),
                    36.ESH(),
                    CustomTextL(
                      contents[index].title.tr,
                      textAlign: TextAlign.center,
                      fontSize: 30.sp,
                      fontWeight: FW.bold,
                    ),
                    15.ESH(),
                    CustomTextL(
                      contents[index].discription,
                      textAlign: TextAlign.center,
                      fontSize: 20.sp,
                    ),
                  ],
                ),
                onPageChanged: (index) {
                  setState(() {
                    onlastpage = (index == 2);
                  });
                },
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                itemCount: _itemCount,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: _itemCount,
                  effect: ExpandingDotsEffect(
                    spacing: 8,
                    dotHeight: 8,
                    dotWidth: 8,
                    dotColor: AppColors.dotColor,
                    activeDotColor: AppColors.activeDotColor,
                  ),
                ),
                onlastpage
                    ? InkWell(
                        onTap: () {
                          Get.offAll(() => const LoginScreen());
                        },
                        child: SizedBox(
                          height: 50.h,
                          child: CustomTextL.title(
                            'Get_Started',
                          ),
                        ))
                    : InkWell(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.iconBlack,
                              ),
                              shape: BoxShape.circle),
                          child: const Icon(Icons.arrow_forward_ios_rounded,
                              size: 20),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
    // SizedBox(
    //   height: Get.height,
    //   width: Get.width,
    //   child: Stack(
    //     children: [
    //       SizedBox(
    //           height: Get.height,
    //           width: Get.width,
    //           child: Image.asset('assets/images/splashBG.png',
    //               fit: BoxFit.fill)),
    //       Align(
    //         alignment: AlignmentDirectional.topCenter,
    //         child: Padding(
    //           padding: EdgeInsets.only(top: 60.h),
    //           child: Image.asset(
    //             'assets/images/Logo.png',
    //             width: 104.w,
    //             height: 106.h,
    //           ),
    //         ),
    //       ),
    //       Column(
    //         mainAxisAlignment: MainAxisAlignment.end,
    //         children: [
    //           Container(
    //             height: 359.h,
    //             width: Get.width,
    //             decoration: BoxDecoration(
    //                 color: AppColors.backGroundGreyFD,
    //                 borderRadius: BorderRadius.vertical(
    //                   top: Radius.circular(32.r),
    //                 ),
    //                 boxShadow: AppColors.boxShadowBlack),
    //             padding: AppPadding.paddingScreenSH16SV16,
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 16.ESH(),
    //                 SmoothPageIndicator(
    //                   controller: _controller,
    //                   count: _itemCount,
    //                   effect: JumpingDotEffect(
    //                     spacing: 8,
    //                     dotHeight: 8,
    //                     dotWidth: 8,
    //                     dotColor: AppColors.dotColor,
    //                     activeDotColor: AppColors.activeDotColor,
    //                   ),
    //                 ),
    //                 16.ESH(),
    //                 Expanded(
    //                   child: PageView.builder(
    //                     onPageChanged: (index) {
    //                       setState(() {
    //                         onlastpage = (index == 3);
    //                       });
    //                     },
    //                     physics: const NeverScrollableScrollPhysics(),
    //                     controller: _controller,
    //                     itemCount: _itemCount,
    //                     itemBuilder: (context, index) {
    //                       return Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           CustomTextR.header(
    //                             contents[index].title.tr,
    //                           ),
    //                           4.ESH(),
    //                           CustomTextR.subtitle(
    //                             contents[index].discription.tr,
    //                             textAlign: TextAlign.start,
    //                           ),
    //                         ],
    //                       );
    //                     },
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 172),
    //         child: PageView.builder(
    //           onPageChanged: (index) {},
    //           physics: const NeverScrollableScrollPhysics(),
    //           controller: controller,
    //           itemCount: _itemCount,
    //           itemBuilder: (context, index) => Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Image.asset(
    //                 contents[index].image,
    //                 fit: BoxFit.contain,
    //                 height: contents[index].height.h,
    //                 width: contents[index].width.w,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: AppPadding.paddingScreenSH16,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.end,
    //           mainAxisAlignment: MainAxisAlignment.end,
    //           children: [
    //             16.ESH(),
    //             onlastpage
    //                 ? ButtonDefault.main(
    //                 title: 'login',
    //                 onTap: () => Get.offAll(() => const LoginScreen()))
    //                 : ButtonDefault.main(
    //                 title: 'next'.tr,
    //                 onTap: () {
    //                   _controller.nextPage(
    //                     duration: const Duration(milliseconds: 500),
    //                     curve: Curves.easeIn,
    //                   );
    //                   controller.nextPage(
    //                     duration: const Duration(milliseconds: 500),
    //                     curve: Curves.easeIn,
    //                   );
    //                 }),
    //             16.ESH(),
    //             onlastpage
    //                 ? ButtonDefault.white(
    //               title: 'login_as_a_guest',
    //               onTap: () {
    //                 Get.offAll(() => const LoginScreen());
    //               },
    //             )
    //                 : ButtonDefault.white(
    //                 title: 'Skip',
    //                 onTap: () {
    //                   _controller.jumpToPage(3);
    //                   controller.jumpToPage(3);
    //                 }),
    //             16.ESH(),
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // ),
  }
}
