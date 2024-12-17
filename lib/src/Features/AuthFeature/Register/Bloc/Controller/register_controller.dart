import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:querium/src/Features/AuthFeature/EditGeneralProfile/Bloc/Controller/edit_general_profile_controller.dart';
import 'package:querium/src/Features/AuthFeature/LogIn/Ui/Screens/login_screen.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Model/area_model.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Model/company_category_model.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Model/nationality_model.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Model/user_model.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Params/register_params.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Repo/register_repo.dart';
import 'package:querium/src/Features/AuthFeature/Verification/Bloc/Controller/send_otp_controller.dart';
import 'package:querium/src/GeneralWidget/Widgets/ImageViewer/image_viewer_list.dart';
import 'package:querium/src/core/services/Base/base_controller.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/pick_image.dart';
import 'package:querium/src/core/services/services_locator.dart';
import 'package:querium/src/core/utils/storage_util.dart';

class RegisterController extends BaseController<RegisterRepository> {
  @override
  // TODO: implement repository
  get repository => sl<RegisterRepository>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  // void _navigateAfterRegister() {
  //   sl<SendOTPController>().sendOTP(
  //     phone: phoneController.text,
  //     verifyAccount: true,
  //   );
  // }
  bool agree = false;

  void agreeWithServices() {
    agree = !agree;
    update(); // To refresh the UI
  }

  void moveToLogIn() {
    Get.off(() => const LoginScreen());
  }

  @override
  void onInit() {
    super.onInit();
    initTextEditingController();
  }

  void initTextEditingController() {
    nameController = TextEditingController();
    emailController = TextEditingController();

    passwordController = TextEditingController();
  }
}
