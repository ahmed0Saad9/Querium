import 'package:get/get.dart';
import 'package:querium/main.dart';

abstract class BaseBinding extends Bindings {
  String get tag => Get.currentRoute + kNumOfNav.toString();
}
