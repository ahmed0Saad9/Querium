import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:querium/src/Features/AccountFeature/Bloc/Repo/reset_password_repo.dart';
import 'package:querium/src/Features/AccountFeature/Bloc/params/reset_password_params.dart';
import 'package:querium/src/Features/AccountFeature/UI/widgets/password_updated_dialog.dart';
import 'package:querium/src/core/services/Base/base_controller.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/services_locator.dart';

class ResetPasswordController extends BaseController<ResetPasswordRepository> {
  @override
  // TODO: implement repository
  get repository => sl<ResetPasswordRepository>();

  late TextEditingController currentPasswordController;

  late TextEditingController newPasswordController;

  late TextEditingController confirmPasswordController;

  @override
  void onInit() {
    // TODO: implement onInit
    _initTextEditController();
    super.onInit();
  }

  void _initTextEditController() {
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  final GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();

  Future<void> resetPassword() async {
    if (resetPasswordKey.currentState!.validate()) {
      resetPasswordKey.currentState!.save();
      showEasyLoading();
      var result = await repository!.postResetPassword(
        resetPasswordParams: ResetPasswordParams(
            currentPassword: currentPasswordController.text,
            newPassword: newPasswordController.text,
            confirmNewPassword: confirmPasswordController.text,
            universityIDCard: sl<GetStorage>().read('universityIDCard')),
      );
      closeEasyLoading();
      result.when(success: (Response response) {
        Get.dialog(
          PasswordUpdatedDialog(),
        );
      }, failure: (NetworkExceptions error) {
        actionNetworkExceptions(error);
      });
    }
  }
}
