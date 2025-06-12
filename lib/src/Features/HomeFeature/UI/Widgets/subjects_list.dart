part of '../screens/home_screen.dart';

class _SubjectsList extends StatelessWidget {
  final SubjectsController controller;
  const _SubjectsList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return (controller.subjects.isNotEmpty)
        ? SizedBox(
            height: 500.h,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w),
              itemBuilder: (context, index) =>
                  _SubjectsCard(subject: controller.subjects[index]),
              itemCount: controller.subjects.length,
              padding: AppPadding.paddingScreenSH36,
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              100.ESH(),
              const SpinKitWave(
                color: AppColors.main,
              ),
            ],
          );
  }
}

class _SubjectsCard extends StatelessWidget {
  final Subjects subject;
  const _SubjectsCard({
    super.key,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 290.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.backGroundGreyF4,
        borderRadius: BorderRadius.circular(
          12.r,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 146.w,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
              child: Image.asset(
                'assets/images/LectureImage.png',
              )),
          13.ESH(),
          Row(
            children: [
              SizedBox(
                width: 150.w,
                child: Column(
                  children: [
                    CustomTextR(
                      subject.title,
                      fontSize: 16.sp,
                      fontWeight: FW.bold,
                      textAlign: TextAlign.center,
                      // isOverFlow: true,
                    ),
                    6.ESH(),
                    CustomTextR(
                      subject.description,
                      fontSize: 12.sp,
                      fontWeight: FW.medium,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      color: AppColors.titleGray52,
                    ),
                    10.ESH(),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
              height: 30.h,
              child: ButtonDefault.main(
                title: 'Start',
                titleSize: 15.sp,
                fw: FW.medium,
                radius: 6,
                onTap: () => Get.to(
                  () => ChaptersScreen(subjectID: subject.id),
                ),
              ))
        ],
      ),
    );
  }
}
