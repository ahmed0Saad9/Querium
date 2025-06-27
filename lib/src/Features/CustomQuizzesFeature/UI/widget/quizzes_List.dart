import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:querium/src/Features/CustomQuizzesFeature/Bloc/Controller/quizzes_controller.dart';
import 'package:querium/src/Features/CustomQuizzesFeature/UI/widget/no_files_uploaded.dart';
import 'package:querium/src/Features/CustomQuizzesFeature/UI/widget/uploaded_file_card.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/utils/extensions.dart';

class QuizzesList extends StatelessWidget {
  final QuizzesController controller;
  const QuizzesList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return controller.uploadedFiles.isNotEmpty
            ? Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      mainAxisExtent: 170),
                  padding:
                      EdgeInsets.symmetric(horizontal: 36.w, vertical: 24.h),
                  itemBuilder: (context, index) => UploadedFileCard(
                    card: controller.uploadedFiles[index],
                  ),
                  itemCount: controller.uploadedFiles.length,
                ),
              )
            : const NoFilesUploaded()
        // Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           100.ESH(),
        //           const SpinKitWave(
        //             color: AppColors.main,
        //           ),
        //         ],
        //       )
        ;
  }
}
