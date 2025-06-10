import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Model/user_model.dart';
import 'package:querium/src/core/constants/app_assets.dart';
import 'package:querium/src/core/services/services_locator.dart';

class LocalStorageCubit extends GetxController {
  static final GetStorage _box = sl<GetStorage>();

  static const String user = 'user_model';

  void storeUserModel(UserModel data) {
    sl<GetStorage>().write("UserName", data.student.fullName);
    sl<GetStorage>().write("universityIDCard", data.student.universityIDCard);
    printDM("ahmmed ${sl<GetStorage>().read(
      "universityIDCard",
    )}");

    // sl<GetStorage>().write("token", data.token);
    sl<GetStorage>().write("email", data.student.email);
    sl<GetStorage>().write("verified", data.student.isApproved);
  }

  void updateUserModel(dynamic data) {
    sl<GetStorage>().write("email", data['data']['email']);
  }

  int getUserId() {
    return sl<GetStorage>().read('user_id');
  }

  // Save Item of strings to local storage
  void saveItem({required String key, required dynamic item}) {
    _box.write(key, item);
  }

  // Get Item of strings from local storage
  dynamic getItem({required String key}) {
    return _box.read(key);
  }

  // User restoreUserModel() {
  //   Map<String, dynamic> map = {};
  //   if (_box.read(user) != null) {
  //     map = _box.read(user);
  //   }
  //   return UserModel.fromJson(map);
  // }

  void removeUserModel() {
    _box.remove("token");
    _box.remove("user_id");
    if (_box.read(user) != null) {
      _box.remove(user);
    }
  }

  static Future<void> clearStorage() async {
    await _box.erase();
  }
}
