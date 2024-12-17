import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;
import 'package:querium/src/Features/AuthFeature/EditGeneralProfile/Bloc/Controller/edit_general_profile_controller.dart';

enum GenderType {
  male,
  female,
}

class RegisterParams {
  final String name;
  final String address;
  final String email;
  final String mobile;
  final String password;
  final String passwordConfirmation;
  final int cityId;
  final int districtId;
  // final String description;
  final MediaType? image;

  RegisterParams({
    this.image,
    required this.cityId,
    required this.districtId,
    required this.name,
    required this.address,
    required this.email,
    required this.mobile,
    required this.password,
    required this.passwordConfirmation,
    // this.description,
  });

  // final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<Map<String, dynamic>> toMap() async {
    String? token = '';
    // try {
    //   token = await _fcm.getToken();
    //   printDM("device_key is => $token");
    // } catch (e) {
    //   printDM('an error occur in fetch token');
    // }
    return {
      'name': name,
      'email': email,
      'phone': '+2$mobile',
      'password': password,
      'city_id': cityId,
      'address': address,
      'district_id': districtId,
      'password_confirmation': password,
      // 'description': description,
      'device_key': 'token',
    };
  }

  Future<FormData> toFormData() async {
    FormData formMap = FormData.fromMap(await toMap());
    if (image != null) {
      formMap.files.add(
        MapEntry(
          'image',
          await MultipartFile.fromFile(
            image!.media.path,
            filename: path.basename(image!.media.path),
          ),
        ),
      );
    }
    return formMap;
  }
}
