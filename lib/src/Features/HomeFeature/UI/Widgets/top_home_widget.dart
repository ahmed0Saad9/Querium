part of '../screens/home_screen.dart';

class _TopHomeWidget extends StatelessWidget {
  const _TopHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.paddingScreenSH36,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomTextL(
                    'Hello',
                    fontWeight: FW.bold,
                  ),
                  4.ESW(),
                  CustomTextR(
                    'Ahmed',
                    fontWeight: FW.bold,
                  ),
                ],
              ),
              4.ESH(),
              CustomTextL(
                'lets_start_the_journey',
                fontSize: 13,
                fontWeight: FW.medium,
              ),
            ],
          ),
          const Spacer(),
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.borderGreyE5),
            child: IconButton(
              onPressed: () => Get.to(
                () => SettingsScreen(),
                transition: Transition.rightToLeftWithFade,
              ),
              icon: Image.asset(
                'assets/images/Settings.png',
                height: 27.h,
                width: 27.w,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
