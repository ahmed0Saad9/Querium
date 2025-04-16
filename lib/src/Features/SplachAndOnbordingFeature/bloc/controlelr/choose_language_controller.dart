import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:querium/src/Features/AuthFeature/Verification/Bloc/Controller/send_otp_controller.dart';
import 'package:querium/src/Features/SplachAndOnbordingFeature/ui/onbording_screen.dart';
import 'package:querium/src/core/services/Lang/localization_services.dart';
import 'package:querium/src/core/services/services_locator.dart';

class ChooseLanguageController extends GetxController {
  final _box = sl<GetStorage>();

  Future<bool> _isLogged() async {
    return (_box.read('token') != null && _box.read('token') != "");
  }

  String selectedLanguage = 'ar';

  void changeLanguage(String languageCode) {
    selectedLanguage = languageCode;
    if (selectedLanguage == 'ar') {
      LocalizationServices().changeLocale("Arabic");
      _box.write("lan", "ar");
      _box.write("language", "arabic");
    } else {
      LocalizationServices().changeLocale("English");
      _box.write("lan", "en");
      _box.write("language", "english");
    }
    update(); // To refresh the UI
  }

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void _navigatorAfterLogIn() {
    // Get.offAll(() => const BaseBNBScreen());
  }

  void moveToOnBoarding() {
    Get.offAll(() => const OnBoardingScreen());
  }

  @override
  void onInit() async {
    super.onInit();
    Timer(const Duration(hours: 2), () async {
      if (await _isLogged() && _box.read('verified') ?? false) {
        // if(_box.read('verified')??false){
        _navigatorAfterLogIn();
        // }else{
        //   _sendOTPController.sendOTP(email: _box.read('email'));
        // }
      } else {
        moveToOnBoarding();
      }
    });
  }
}
