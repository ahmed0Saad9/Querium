import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:querium/src/core/services/Lang/localization_services.dart';
import 'package:querium/src/core/services/services_locator.dart';

class SettingsController extends GetxController {
  bool notification = false;

  void toggleNotification() {
    notification = !notification;
    update();
  }

  bool Update = false;

  void toggleUpdate() {
    Update = !Update;
    update();
  }

  bool darkMode = false;

  void toggleDarkMode() {
    darkMode = !darkMode;
    update();
  }

  final _box = sl<GetStorage>();
  String? selectedLanguage;

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
}
