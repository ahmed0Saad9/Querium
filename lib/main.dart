import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:querium/src/core/services/Firebase/FCM/local_notification_service.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Screens/forget_password_screen.dart';
import 'package:querium/src/Features/AuthFeature/LogIn/Ui/Screens/login_screen.dart';
import 'package:querium/src/Features/AuthFeature/Register/Ui/Screens/account_approved_screen.dart';
import 'package:querium/src/Features/AuthFeature/Register/Ui/Screens/pending_screen.dart';
import 'package:querium/src/Features/AuthFeature/Register/Ui/Screens/register_screen.dart';
import 'package:querium/src/Features/BaseBNBFeature/UI/screens/base_BNB_screen.dart';
import 'package:querium/src/Features/HomeFeature/UI/screens/home_screen.dart';
import 'package:querium/src/Features/HomeFeature/UI/screens/quiz_screen.dart';
import 'package:querium/src/Features/SplachAndOnbordingFeature/ui/onbording_screen.dart';
import 'package:querium/src/Features/SplachAndOnbordingFeature/ui/splash_screen.dart';
import 'src/Features/AuthFeature/Register/Ui/Screens/account_denied_screen.dart';
import 'src/Features/SplachAndOnbordingFeature/ui/choose_language_screen.dart';
import 'src/GeneralWidget/Widgets/Loading/loading_dialog.dart';
import 'src/core/App/app_initializer.dart';
import 'src/core/ThemeData/theme_constant.dart';
import 'src/core/constants/app_strings.dart';
import 'src/core/constants/color_constants.dart';
import 'src/core/services/Lang/localization_services.dart';
import 'src/core/services/Network/network_services.dart';

int kNumOfNav = 0;

/// start background
@pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// LocalNotificationService.launchNotification(message: message);
// }

void main() async {
  // HttpOverrides.global = _MyHttpOverrides();
  initializeDateFormatting('ar', null); // Initialize Arabic locale

  await AppInitializer.initializeApp();

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.chasingDots
      ..loadingStyle = EasyLoadingStyle.custom
      ..toastPosition = EasyLoadingToastPosition.center
      ..boxShadow = <BoxShadow>[]
      ..indicatorWidget = const EasyLoader()
      // ..errorWidget = Container(
      //   color: Colors.cyanAccent,
      //   height: 2222,
      //   width: 222,
      // )
      ..maskType = EasyLoadingMaskType.custom
      ..indicatorSize = 0.0
      ..radius = 12
      ..progressColor = AppColors.main
      ..backgroundColor = Colors.white
      ..indicatorColor = AppColors.main
      ..textColor = Colors.white
      ..maskColor = Colors.black12.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(NetworkService());

    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(430, 932),
      builder: (context, child) => GetMaterialApp(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.native,
        transitionDuration: const Duration(milliseconds: 200),
        translations: LocalizationServices(),
        locale: LocalizationServices().getCurrentLocale(),
        title: AppStrings.appName,
        theme: mainTheme(AppColors.main),

        routingCallback: (Routing? route) => route == null ||
                route.isBlank! ||
                route.isBottomSheet! ||
                route.isDialog!
            ? kNumOfNav
            : route.isBack!
                ? kNumOfNav--
                : kNumOfNav++,
        // home: const SplashScreen(),

        // home: const QuizScreen(),
        home: const BaseBNBScreen(),
        // home: const ForgetPasswordScreen(),
        // home: const AccountDeniedScreen(),
      ),
    );
  }
}
