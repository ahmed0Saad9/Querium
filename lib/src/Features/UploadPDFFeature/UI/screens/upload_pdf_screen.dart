import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/UploadPDFFeature/controller/upload_pdf_controller.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/services/svg_widget.dart';
import 'package:querium/src/core/utils/extensions.dart';

class UploadPDFScreen extends StatelessWidget {
  const UploadPDFScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UploadPDFController>(
      init: UploadPDFController(),
      builder: (controller) => BaseScaffold(
        appBar: AppBars.appBarBack(title: 'Create_Quiz_Set', isBack: false),
        body: Padding(
          padding: AppPadding.paddingScreenSH36,
          child: Column(
            children: [
              50.ESH(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextL.header(
                    'File_Upload',
                    fontSize: 24.sp,
                    color: AppColors.main,
                  ),
                  16.ESW(),
                  const IconSvg(
                    'PDFUpload',
                    size: 50,
                    boxFit: BoxFit.fill,
                  )
                ],
              ),
              16.ESH(),
              Container(
                width: Get.width,
                height: 400.h,
                decoration: BoxDecoration(
                  color: AppColors.backGroundWhiteF1,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: AppColors.borderGreyDF,
                    width: 5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    controller.fileName != null
                        ? Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  controller.clearFile();
                                },
                                icon: const IconSvg('ClosePDF'),
                              ),
                            ],
                          )
                        : 55.ESH(),
                    DottedBorder(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18.w, vertical: 1.h),
                      borderType: BorderType.RRect,
                      radius: Radius.circular(10.r),
                      dashPattern: const [10, 10],
                      color: AppColors.borderGreyB9,
                      strokeWidth: 2,
                      borderPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: InkWell(
                        onTap: () => controller.pickImage(),
                        child: SizedBox(
                          height: 255.h,
                          width: 255.w,
                          child: Center(
                            child: controller.fileName != null
                                ? Container(
                                    padding: AppPadding.paddingScreenSH16SV16,
                                    decoration: BoxDecoration(
                                      color: AppColors.backGroundWhite,
                                      borderRadius: BorderRadius.circular(14.r),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const IconSvg(
                                          'RedPDF',
                                          size: 150,
                                          boxFit: BoxFit.fill,
                                        ),
                                        10.ESH(),
                                        CustomTextR(
                                          '${controller.fileName}',
                                          fontWeight: FW.medium,
                                          fontSize: 14,
                                        ),
                                        4.ESH(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomTextR.subtitle(
                                              controller.fileSize!
                                                  .toStringAsFixed(2),
                                              fontSize: 11,
                                            ),
                                            4.ESW(),
                                            CustomTextR.subtitle(
                                              'KB',
                                              fontSize: 11,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(
                                    height: Get.height,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      color: AppColors.backGroundWhite,
                                      borderRadius: BorderRadius.circular(14.r),
                                    ),
                                    child: const IconSvg(
                                      'DesignFile',
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    30.ESH(),
                    CustomTextL(
                      'Drop_your_files_here',
                      fontSize: 18.sp,
                      color: AppColors.titleGray76,
                      fontWeight: FW.medium,
                    ),
                  ],
                ),
              ),
              Spacer(),
              ButtonDefault.main(
                title: 'Generate',
                onTap: () {},
                active: controller.fileName != null,
              ),
              20.ESH(),
            ],
          ),
        ),
      ),
    );
  }
}
