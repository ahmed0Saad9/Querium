import 'package:querium/src/Features/AuthFeature/Register/Bloc/Model/user_model.dart';

mixin ApiKey {
  static const String apiBaseUrl = 'http://querium13.runasp.net/api/';

  static const String account = 'account/';
  static const String public = 'public/';
  static const String transactions = 'transactions/';
  static const String customer = 'customer/';
  static const String student = 'Student/';

  /// Auth
  final String uRLSetting = "${apiBaseUrl}setting";
  final String uRLLogin = "$apiBaseUrl${student}login";
  final String uRLLogout = "$apiBaseUrl$customer${account}logout";
  final String uRLGetMyAccountData = "$apiBaseUrl${account}my-account";
  final String uRLUpdateMyAccountData =
      "$apiBaseUrl${account}my-account/update";
  final String uRLVerifyAccount =
      "$apiBaseUrl${account}my-account/verify-account";
  final String uRLSendOTP = "$apiBaseUrl$customer${account}send-verify-otp";
  final String uRLVerifyAccountOtp =
      "$apiBaseUrl$customer${account}validate-otp-and-verify-account";
  final String uRLRegister = "${apiBaseUrl}${student}register";
  final String uRLCities = "$apiBaseUrl${public}cities";
  final String uRLDistricts = "$apiBaseUrl${public}districts";

  final String uRLCheckPhoneAndSendOtp = "${apiBaseUrl}forgot-password";
  final String uRLValidateOtpAndChangePassword =
      "${apiBaseUrl}validate-otp-and-change-password";
  final String uRLGetMyNotifications =
      "$apiBaseUrl${account}my-account/notifications";

  final String uRLCheckQrCode = "$apiBaseUrl${account}qr-code-check";

  final String uRLNotifications = "$apiBaseUrl${account}notifications?=";

  // app
  final String uRLGetQuestions = "${apiBaseUrl}FileUpload/questions";
}
