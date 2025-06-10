part of '../screens/home_screen.dart';

class _SubjectsList extends StatelessWidget {
  const _SubjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 230.h,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w),
        itemBuilder: (context, index) => const _SubjectsCard(),
        itemCount: 10,
        padding: AppPadding.paddingScreenSH36,
      ),
    );
  }
}

class _SubjectsCard extends StatelessWidget {
  const _SubjectsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              height: 138.h,
              width: 146.w,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
              child: Image.asset(
                'assets/images/LectureImage.png',
              )),
          10.ESH(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextR(
                'Subject',
                fontSize: 14.sp,
                fontWeight: FW.bold,
              ),
            ],
          ),
          // 13.ESH(),
          const Spacer(),
          SizedBox(
              height: 30.h,
              child: ButtonDefault.main(
                title: 'Start',
                titleSize: 15.sp,
                fw: FW.medium,
                radius: 6,
                onTap: () => Get.to(
                  () => const ChaptersScreen(),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 200),
                ),
              ))
        ],
      ),
    );
  }
}
