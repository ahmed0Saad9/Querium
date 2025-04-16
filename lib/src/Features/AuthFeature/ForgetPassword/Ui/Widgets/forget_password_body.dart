// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:querium/src/Features/AuthFeature/ForgetPassword/Bloc/Controller/forget_password_controller.dart';
// import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Widgets/email_masked.dart';
// import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Widgets/phone_number_masked.dart';
// import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
// import 'package:querium/src/core/constants/color_constants.dart';
// import 'package:querium/src/core/constants/sizes.dart';
// import 'package:querium/src/core/services/svg_widget.dart';
// import 'package:querium/src/core/utils/extensions.dart';
//
// class ForgetPasswordBody extends StatelessWidget {
//   final ForgetPasswordController controller;
//
//   const ForgetPasswordBody({
//     super.key,
//     required this.controller,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColors.backGroundGreyFD,
//       padding: AppPadding.paddingScreenSH16,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               CustomTextL.title(
//                 'verify_your_account',
//               ),
//             ],
//           ),
//           14.0.ESH(),
//           Image.asset(
//             'assets/images/AccountVerification.png',
//             width: 295.w,
//             height: 287.h,
//           ),
//           14.ESH(),
//           InkWell(
//             onTap: () => controller.viaMessage(),
//             child: Row(
//               children: [
//                 const IconSvg(
//                   'Message',
//                   size: 40,
//                 ),
//                 16.ESW(),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const CustomTextL(
//                       'via_text_message',
//                       fontSize: 16,
//                       color: AppColors.titleGray95,
//                     ),
//                     4.ESH(),
//                     const PhoneNumberMasked(phoneNumber: '01122982156'),
//                   ],
//                 ),
//                 const Spacer(),
//                 Container(
//                   height: 22.h,
//                   width: 22.w,
//                   decoration: BoxDecoration(
//                     color: controller.message
//                         ? AppColors.main
//                         : AppColors.transparentColor,
//                     shape: BoxShape.circle,
//                   ),
//                   child:
//                       controller.message ? const IconSvg('check') : 0.0.ESH(),
//                 )
//               ],
//             ),
//           ),
//           const Divider(
//             color: AppColors.borderGreyE5,
//           ),
//           InkWell(
//             onTap: () => controller.viaEmail(),
//             child: Row(
//               children: [
//                 const IconSvg(
//                   'Message',
//                   size: 40,
//                 ),
//                 16.ESW(),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const CustomTextL(
//                       'via_text_message',
//                       fontSize: 16,
//                       color: AppColors.titleGray95,
//                     ),
//                     4.ESH(),
//                     EmailMasked(email: 'ahmedsaad@gmail.com'),
//                   ],
//                 ),
//                 const Spacer(),
//                 Container(
//                   height: 22.h,
//                   width: 22.w,
//                   decoration: BoxDecoration(
//                     color: controller.email
//                         ? AppColors.main
//                         : AppColors.transparentColor,
//                     shape: BoxShape.circle,
//                   ),
//                   child: controller.email ? const IconSvg('check') : 0.0.ESH(),
//                 )
//               ],
//             ),
//           ),
//           22.ESH(),
//         ],
//       ),
//     );
//   }
// }
