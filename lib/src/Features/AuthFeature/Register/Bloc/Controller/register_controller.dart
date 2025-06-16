import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:querium/src/Features/AuthFeature/LogIn/Ui/Screens/login_screen.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Model/user_model.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Params/register_params.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Repo/register_repo.dart';
import 'package:querium/src/Features/AuthFeature/Register/Ui/Screens/account_approved_screen.dart';
import 'package:querium/src/Features/AuthFeature/Register/Ui/Screens/pending_screen.dart';
import 'package:querium/src/Features/AuthFeature/Verification/Bloc/Controller/send_otp_controller.dart';
import 'package:querium/src/core/services/Base/base_controller.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/services_locator.dart';

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

        if (userModel.student.isApproved == false) {
          Get.to(
            () => const PendingScreen(),
          );
        } else {
          Get.to(
            () => const AccountApprovedScreen(),
          );
        }
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
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    idOfCollegeController = TextEditingController();
    nationalIdController = TextEditingController();
  }
}
