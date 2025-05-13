import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Screens/forget_password_screen.dart';
import 'package:querium/src/Features/AuthFeature/LogIn/Bloc/Repo/login_repo.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Model/user_model.dart';
import 'package:querium/src/Features/AuthFeature/Register/Ui/Screens/account_approved_screen.dart';
import 'package:querium/src/Features/AuthFeature/Register/Ui/Screens/account_denied_screen.dart';
import 'package:querium/src/Features/AuthFeature/Register/Ui/Screens/pending_screen.dart';
import 'package:querium/src/Features/AuthFeature/Register/Ui/Screens/register_screen.dart';
import 'package:querium/src/Features/AuthFeature/Verification/Bloc/Controller/send_otp_controller.dart';
import 'package:querium/src/Features/BaseBNBFeature/UI/screens/base_BNB_screen.dart';
import 'package:querium/src/core/services/Base/base_controller.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/services_locator.dart';
import 'package:querium/src/core/utils/storage_util.dart';

class LoginController extends BaseController<LogInRepository> {
  @override
  // TODO: implement repository
  get repository => sl<LogInRepository>();
  TextEditingController? emailController;
  TextEditingController? passwordController;

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  UserModel? _userModel;

  Future<void> logIn() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      showEasyLoading();
      var result = await repository!.logIn(
        password: passwordController!.text,
        email: emailController!.text,
      );
      closeEasyLoading();
      result.when(success: (Response response) {
        _userModel = UserModel.fromJson(response.data);
        LocalStorageCubit().storeUserModel(_userModel!);
        // LocalStorageCubit()
        //     .saveItem(key: 'avatar', item: _userModel!.data.user.image);
        _navigatorAfterLogIn(_userModel!);
      }, failure: (NetworkExceptions error) {
        actionNetworkExceptions(error);
      });
    }
  }

  void navigatorToBaseBNBScreen() {
    Get.offAll(() => const BaseBNBScreen());
  }

  /// check OTP is Verified
  final SendOTPController _sendOTPController = sl<SendOTPController>();

  void _navigatorAfterLogIn(UserModel user) async {
    // if (!user.verified) {
    //   _sendOTPController.sendOTP(
    //       email: emailController!.text, verifyAccount: true);
    // } else {
    if (user.student.isApproved) {
      Get.offAll(() => const AccountApprovedScreen());
    }
    // navigatorToBaseBNBScreen();
    successEasyLoading('hello');
    // }
  }

  /// move To Forget Password
  void moveToForgetPassword() {
    Get.to(() => const ForgetPasswordScreen());
  }

  /// move To Register
  void moveToRegister() {
    Get.off(() => const RegisterScreen());
  }

  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController(text: 'ssssss@gmail.com');
    passwordController = TextEditingController(text: '123456789aA@');
  }

  @override
  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }
}
