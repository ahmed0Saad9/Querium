part of '../screens/home_screen.dart';

class _HistoryGrid extends StatelessWidget {
  const _HistoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextL(
          'History',
          fontWeight: FW.bold,
          fontSize: 25.sp,
          padding: AppPadding.paddingScreenSH36,
        ),
        13.ESH(),
        GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(
            left: 36.w,
            right: 36.w,
            bottom: 32.h,
          ),
          itemCount: 15,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.backGroundRedF6,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: const Center(
                child: CustomTextL(
              'PDF Set',
              color: AppColors.titleWhite,
            )),
          ),
        )
      ],
    );
  }
}
