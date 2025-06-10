import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:get/instance_manager.dart';
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
import 'package:querium/src/Features/AuthFeature/Register/Ui/Screens/account_approved_screen.dart';
import 'package:querium/src/Features/AuthFeature/Register/Ui/Screens/pending_screen.dart';
import 'package:querium/src/Features/AuthFeature/Verification/Bloc/Controller/send_otp_controller.dart';
import 'package:querium/src/Features/BaseBNBFeature/UI/screens/base_BNB_screen.dart';
import 'package:querium/src/Features/HomeFeature/UI/screens/home_screen.dart';
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
  final GlobalKey<FormState> registerGlobalKey = GlobalKey<FormState>();
  final SendOTPController _sendOTPController = Get.put(SendOTPController());

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController idOfCollegeController;
  late TextEditingController nationalIdController;

  // void _navigateAfterRegister() {
  //   sl<SendOTPController>().sendOTP(
  //     phone: phoneController.text,
  //     verifyAccount: true,
  //   );
  // }
  UserModel? _userModel;
  var isApproved = false.obs;

  void createAccount() async {
    if (registerGlobalKey.currentState!.validate()) {
      registerGlobalKey.currentState!.save();
      showEasyLoading();
      var result = await repository!.register(
        registerParams: RegisterParams(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          passwordConfirmation: confirmPasswordController.text,
          nationalId: nationalIdController.text,
          idOfCollege: idOfCollegeController.text,
        ),
      );
      closeEasyLoading();
      result.when(success: (Response response) {
        UserModel userModel = UserModel.fromJson(response.data);
        // LocalStorageCubit().storeUserModel(userModel);
        // LocalStorageCubit()
        //     .saveItem(key: 'isApproved', item: userModel.student.isApproved);
        // box.write('isApproved', _userModel?.student.isApproved);
        // if (box.read('isApproved') == false) {
        if (userModel.student.isApproved == false) {
          Get.to(
            () => const PendingScreen(),
          );
        } else {
          Get.to(
            () => const AccountApprovedScreen(),
          );
        }
        // _sendOTPController.sendOTP(email: userModel.data.user.email);
        successEasyLoading(response.data['message'] ?? "success");
      }, failure: (NetworkExceptions error) {
        actionNetworkExceptions(error);
      });
    }
  }

  void _startApprovalPolling(String userId) {
    // Check every 5 seconds (adjust as needed)
    const interval = Duration(seconds: 5);

    // Use Worker to manage the polling
    ever(isApproved, (approved) {
      if (approved) {
        // Stop polling when approved
        Get.off(
            const AccountApprovedScreen()); // Navigate to home when approved
      }
    });
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
    passwordController = TextEditingController(text: '123456789aA@');
    confirmPasswordController = TextEditingController(text: '123456789aA@');

    idOfCollegeController = TextEditingController();
    nationalIdController = TextEditingController();
  }
}
