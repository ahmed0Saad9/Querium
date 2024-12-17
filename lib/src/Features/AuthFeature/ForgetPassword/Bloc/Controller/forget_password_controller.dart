import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Bloc/repo/check_email_and_send_otp_repo.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Bloc/repo/validate-otp-and-change-password_repo.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Screens/back_to_login_screen.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Ui/Screens/new_password_screen.dart';
import 'package:querium/src/Features/AuthFeature/Verification/Ui/Screens/verification_forget_password_screen.dart';
import 'package:querium/src/core/services/Base/base_controller.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/services_locator.dart';

class ForgetPasswordController
    extends BaseController<CheckPhoneAndSendOtpRepo> {
  @override
  // TODO: implement repository
  get repository => sl<CheckPhoneAndSendOtpRepo>();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  String _token = '';
  String _code = '';

  Future<void> sendOtp({bool isResendCode = false}) async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      showEasyLoading();
      var result =
          await repository!.checkPhoneAndSendOtp(phone: emailController.text);
      closeEasyLoading();
      result.when(success: (Response response) {
        _token = response.data['data']['verify_token'];
        _code = response.data['data']['code'];
        if (!isResendCode) {
          Get.to(() => VerificationForgetPasswordScreen(
                token: _token,
                phone: emailController.text,
              ));
        }
        successEasyLoading(response.data["message"] ?? "Success");
      }, failure: (NetworkExceptions error) {
        actionNetworkExceptions(error);
      });
    }
  }

  bool message = true;
  bool email = false;

  void viaMessage() {
    message = true;
    email = false;

    update();
  }

  void viaEmail() {
    email = true;
    message = false;
    update();
  }

  void checkCode() {
    if (pinCodeController.text.length == 4) {
      if (_code == pinCodeController.text) {
        Get.to(() => const NewPasswordScreen());
      } else {
        errorEasyLoading("كود خاطء");
      }
    }
  }

  final GlobalKey<FormState> resetPasswordGlobalKey = GlobalKey<FormState>();

  final ValidateOtpAndChangePasswordRepo _validateOtpAndChangePasswordRepo =
      sl<ValidateOtpAndChangePasswordRepo>();

  Future<void> validateOtpAndChangePassword() async {
    if (resetPasswordGlobalKey.currentState!.validate() &&
        pinCodeController.text.length == 4) {
      resetPasswordGlobalKey.currentState!.save();
      showEasyLoading();
      var result =
          await _validateOtpAndChangePasswordRepo.validateOtpAndChangePassword(
        verifyToken: _token,
        otp: pinCodeController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
      );
      closeEasyLoading();
      result.when(success: (Response response) {
        Get.offAll(() => const BackToLoginScreen());
        successEasyLoading(response.data["message"] ?? "Success");
      }, failure: (NetworkExceptions error) {
        actionNetworkExceptions(error);
      });
    }
  }

  int _duration = 1;

  int get duration => _duration;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _initTextEditing();
  }

  void _initTextEditing() {
    pinCodeController = TextEditingController();
    errorController = StreamController<ErrorAnimationType>();
    passwordController = TextEditingController();
    // passwordController = TextEditingController(text: "123456789");
    confirmPasswordController = TextEditingController();
    // confirmPasswordController = TextEditingController(text: "123456789");
    emailController = TextEditingController();
    // emailController = TextEditingController(text: 'api@test.com');
  }

  void _disposeTextEditing() {
    pinCodeController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
  }
}
