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
            left: 45.w,
            right: 36.w,
            bottom: 32.h,
          ),
          itemCount: 15,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 2,
          ),
          itemBuilder: (context, index) => const _HistoryWidget(),
        )
      ],
    );
  }
}

class _HistoryWidget extends StatelessWidget {
  const _HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 110.h,
          width: 145.w,
          decoration: BoxDecoration(
            color: AppColors.backGroundRedF6,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: const Center(
            child: CustomTextL(
              'Quiz set',
              color: AppColors.titleWhite,
            ),
          ),
        ),
        10.ESH(),
        const CustomTextR(
          'Quiz Name',
          fontWeight: FW.bold,
          fontSize: 14,
        ),
        2.ESH(),
        const CustomTextR(
          'By: Antony Hopkins',
          fontWeight: FW.medium,
          fontSize: 12,
          color: AppColors.titleGray52,
        ),
      ],
    );
  }
}
