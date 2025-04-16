import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/AuthFeature/EditGeneralProfile/Bloc/Controller/edit_general_profile_controller.dart';

import 'package:querium/src/GeneralWidget/Widgets/Other/custom_stepper.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/top_custom_container.dart';
import 'package:querium/src/GeneralWidget/Widgets/StaggeredAnimations/base_column.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/TextFields/text_field_default.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';
import 'package:querium/src/core/utils/validator.dart';

import '../../../../../core/services/svg_widget.dart';

class EditProfileTFBody extends StatelessWidget {
  final EditProfileController controller;

  const EditProfileTFBody({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return SizedBox(
      width: Get.width,
      child: Form(
        key: controller.globalKey,
        child: BaseStaggeredColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.ESH(),
            Padding(
              padding: AppPadding.paddingScreenSH16,
              child: Row(
                children: [
                  Expanded(
                      child: TextFieldDefault(
                    hint: 'first_name',
                    prefixIconUrl: 'user',
                    controller: controller.firstNameController,
                    validation: emptyValidator,
                    onComplete: () {
                      node.nextFocus();
                    },
                  )),
                  8.ESW(),
                  Expanded(
                      child: TextFieldDefault(
                    hint: 'second_name',
                    prefixIconUrl: 'user',
                    controller: controller.secondNameController,
                    validation: emptyValidator,
                    onComplete: () {
                      node.nextFocus();
                    },
                  )),
                ],
              ),
            ),
            16.ESH(),
            TextFieldDefault(
              hint: 'phone_number',
              prefixIconUrl: 'PhoneNumber',
              keyboardType: TextInputType.phone,
              controller: controller.phoneController,
              validation: phoneValidator,
              outerHorizontalPadding: 16.w,
              onComplete: () {
                node.nextFocus();
              },
            ),
            16.ESH(),
            TextFieldDefault(
              hint: 'Email',
              prefixIconUrl: 'Email',
              isPrefixIcon: true,
              controller: controller.emailController,
              validation: emailValidator,
              outerHorizontalPadding: 16.w,
              keyboardType: TextInputType.emailAddress,
              onComplete: () {
                node.nextFocus();
              },
            ),
            16.ESH(),
            Padding(
              padding: AppPadding.paddingScreenSH16,
              child: Row(
                children: [],
              ),
            ),
            16.ESH(),
            TextFieldDefault(
              hint: 'address',
              prefixIconUrl: 'Address',
              controller: controller.addressController,
              validation: emptyValidator,
              outerHorizontalPadding: 16.w,
              keyboardType: TextInputType.text,
              onComplete: () {
                node.nextFocus();
              },
            ),
            16.ESH(),
            DottedBorder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              borderType: BorderType.RRect,
              radius: Radius.circular(8.r),
              dashPattern: const [5, 5],
              color: AppColors.main,
              strokeWidth: 1,
              borderPadding: EdgeInsets.symmetric(horizontal: 16.w),
              child: InkWell(
                onTap: () => controller.pickImage(),
                child: SizedBox(
                  height: 80.h,
                  width: Get.width,
                  child: Center(
                    child: controller.fileName != null
                        ? Padding(
                            padding: AppPadding.paddingScreenSH16SV16,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    controller.clearFile();
                                  },
                                  icon: const IconSvg('CloseCircle'),
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CustomTextR(
                                      '${controller.fileName}',
                                      fontWeight: FW.medium,
                                      fontSize: 14,
                                    ),
                                    15.ESH(),
                                    Row(
                                      children: [
                                        CustomTextR.subtitle(
                                          'KB ',
                                          fontSize: 11,
                                        ),
                                        CustomTextR.subtitle(
                                          controller.fileSize!
                                              .toStringAsFixed(2),
                                          fontSize: 11,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                10.ESW(),
                                Image.asset('assets/images/PDF.png'),
                              ],
                            ),
                          )
                        : const CustomTextL('upload_your_Personal_identity',
                            color: AppColors.titleGreen),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
