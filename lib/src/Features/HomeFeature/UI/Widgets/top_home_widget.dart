part of '../screens/home_screen.dart';

class _TopHomeWidget extends StatelessWidget {
  const _TopHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.paddingScreenSH36,
      child: Row(
        children: [
          CardAvatarImage(
              size: 45,
              image: LocalStorageCubit().getItem(
                    key: 'avatar',
                  ) ??
                  ''),
          20.ESW(),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextR(
                'Hello, Ahmed',
                fontWeight: FW.bold,
              ),
              CustomTextR(
                'let’s start the  journey.',
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
