import 'package:get/get.dart';

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
}
