part of '../screens/home_screen.dart';

class _LectureList extends StatelessWidget {
  const _LectureList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.separated(
        itemBuilder: (context, index) => const _LectureCard(),
        separatorBuilder: (context, index) => 14.ESW(),
        itemCount: 6,
        padding: AppPadding.paddingScreenSH36,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class _LectureCard extends StatelessWidget {
  const _LectureCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.transparentColor,
        borderRadius: BorderRadius.circular(
          12.r,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                  height: 138.h,
                  width: 146.w,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
                  child: Image.asset(
                    'assets/images/LectureImage.png',
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.r),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0.2, sigmaY: 0.2),
                    child: Container(
                      width: 35.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: AppColors.gradientTransparentWhite,
                        border: Border.all(
                          color: AppColors.borderwhite.withOpacity(0.43),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const IconSvg(
                          'Heart',
                          boxFit: BoxFit.fill,
                          size: 18,
                        ),
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.all(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          10.ESH(),
          CustomTextR(
            'lecture',
            fontSize: 14.sp,
            fontWeight: FW.bold,
          ),
          CustomTextR(
            'By: Antony Hopkins',
            fontSize: 10.sp,
            fontWeight: FW.medium,
          ),
          15.ESH(),
          SizedBox(
              height: 25.h,
              width: 140.w,
              child: BM.ButtonDefault.main(
                title: 'Start',
                titleSize: 12.sp,
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
