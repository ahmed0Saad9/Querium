// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:querium/src/core/constants/color_constants.dart';
// import 'package:querium/src/core/utils/extensions.dart';
//
// import '../../../core/services/image_network.dart';
//
// class AvatarForm extends StatefulWidget {
//   final Function(String) onTap;
//   String futureImage;
//   final bool isUpload;
//   final double size;
//
//   AvatarForm({
//     super.key,
//     required this.onTap,
//     this.futureImage = "",
//     this.isUpload = true,
//     this.size = 80,
//   });
//
//   @override
//   State<AvatarForm> createState() => _AvatarFormState();
// }
//
// class _AvatarFormState extends State<AvatarForm> {
//   File? image;
//   String? img64;
//
//   Future getImage() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (image == null) return;
//       final imageTemporary = File(image.path);
//       setState(() => this.image = imageTemporary);
//       final bytes = File(image.path).readAsBytesSync();
//       img64 = base64Encode(bytes);
//       widget.onTap(img64!);
//     } on PlatformException catch (e) {
//       debugPrint("field picked image $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(
//         height: widget.size.w,
//         width: widget.size.w,
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(777.r),
//               child: SizedBox(
//                 height: 80.w,
//                 width: 80.w,
//                 child: CircleAvatar(
//                   radius: 80.r,
//                   child: widget.futureImage == null || widget.futureImage == ""
//                       ? image != null
//                           ? Image.file(
//                               image!,
//                               fit: BoxFit.cover,
//                               height: 80.w,
//                               width: 80.w,
//                             )
//                           : Image.asset(
//                               "assets/images/defoultAvatar.png",
//                               fit: BoxFit.cover,
//                             )
//                       : GestureDetector(
//                           onTap: () {
//                             // PhotoViewWidget(
//                             //   imageProvider:
//                             //   NetworkImage(widget.futureImage),
//                             // ),
//                           },
//                           child: ImageNetwork(
//                             url: widget.futureImage,
//                             height: double.infinity,
//                             width: double.infinity,
//                             boxFit: BoxFit.cover,
//                           ),
//                         ),
//                 ),
//                 // Container(
//                 //   height: 80.w,
//                 //   width: 80.w,
//                 //   decoration: BoxDecoration(
//                 //     borderRadius: BorderRadius.circular(7777.r),
//                 //   ),
//                 //   child: image != null
//                 //       ? Image.file(image!,fit: BoxFit.cover,
//                 //   )
//                 //       : Image.asset(
//                 //           "assets/image/defoultAvatar.png",
//                 //           fit: BoxFit.cover,
//                 //         ),
//                 // ),
//               ),
//             ),
//             widget.isUpload
//                 ? Padding(
//                     padding: EdgeInsets.only(bottom: 5.h, left: 5.w),
//                     child: Align(
//                       alignment: Alignment.bottomLeft,
//                       child: InkWell(
//                         onTap: () {
//                           if (image != null || widget.futureImage != "") {
//                             setState(() {
//                               image = null;
//                               img64 = null;
//                               widget.futureImage = "";
//                               widget.onTap("");
//                             });
//                           } else {
//                             getImage();
//                           }
//                         },
//                         child: Container(
//                           height: 16.w,
//                           width: 16.w,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(7777.r),
//                             color: AppColors.main,
//                           ),
//                           child: Center(
//                             child: Icon(
//                                 image != null || widget.futureImage != ""
//                                     ? Icons.clear
//                                     : Icons.add,
//                                 color: Colors.white,
//                                 size: 8.w),
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 : 0.ESH(),
//           ],
//         ),
//       ),
//     );
//   }
// }
