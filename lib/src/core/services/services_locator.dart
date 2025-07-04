import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:querium/src/Features/AccountFeature/Bloc/Repo/profile_repo.dart';
import 'package:querium/src/Features/AccountFeature/Bloc/Repo/reset_password_repo.dart';
import 'package:querium/src/Features/AuthFeature/DeleteAccount/Bloc/Repo/delete_account_repo.dart';
import 'package:querium/src/Features/AuthFeature/EditGeneralProfile/Bloc/Repo/efit_profile_repo.dart';
import 'package:querium/src/Features/AuthFeature/EditGeneralProfile/Bloc/Repo/get_user_data_repo.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Bloc/repo/check_email_and_send_otp_repo.dart';
import 'package:querium/src/Features/AuthFeature/ForgetPassword/Bloc/repo/validate-otp-and-change-password_repo.dart';
import 'package:querium/src/Features/AuthFeature/LogIn/Bloc/Repo/login_repo.dart';
import 'package:querium/src/Features/AuthFeature/LogOut/Bloc/Repo/log_out_repo.dart';

import 'package:querium/src/Features/AuthFeature/Register/Bloc/Repo/get_company_categories_repo.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Repo/register_repo.dart';
import 'package:querium/src/Features/AuthFeature/Verification/Bloc/Controller/send_otp_controller.dart';
import 'package:querium/src/Features/AuthFeature/Verification/Bloc/Repo/send_otp_repository.dart';
import 'package:querium/src/Features/AuthFeature/Verification/Bloc/Repo/verify_otp_repository.dart';
import 'package:querium/src/Features/CustomQuizzesFeature/Bloc/Repo/custom_quiz_repo.dart';
import 'package:querium/src/Features/CustomQuizzesFeature/Bloc/Repo/uploaded_file_repo.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/Repo/chapters_repo.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/Repo/subjects_repo.dart';
import 'package:querium/src/Features/QuizFeature/Bloc/Repo/get_questions_repo.dart';
import 'package:querium/src/core/ThemeData/theme_manager.dart';
import 'package:querium/src/core/services/Network/network_services.dart';

import '../../Features/UploadPDFFeature/Bloc/Repo/upload_file_repo.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///
    /// use cases
    ///
    // Home
    // sl.registerLazySingleton(() => GetAllFingerPrintUseCase(sl()));

    ///
    /// REPOSITORY
    ///
    // sl.registerLazySingleton(() => GetSettingRepository());
    // Auth
    sl.registerLazySingleton(() => LogInRepository());
    sl.registerLazySingleton(() => SendOTPController());
    // sl.registerLazySingleton(() => GetMyAccountDataRepository());
    sl.registerLazySingleton(() => LogOutRepository());
    sl.registerLazySingleton(() => DeleteAccountRepository());
    sl.registerLazySingleton(() => ResetPasswordRepository());
    sl.registerLazySingleton(() => RegisterRepository());
    sl.registerLazySingleton(() => SendOTPRepository());
    sl.registerLazySingleton(() => VerifyOTPRepository());
    sl.registerLazySingleton(() => GetCompanyCategoriesRepository());
    sl.registerLazySingleton(() => CheckEmailAndSendOtpRepo());
    sl.registerLazySingleton(() => ValidateOtpAndChangePasswordRepo());
    sl.registerLazySingleton(() => EditGeneralProfileRepository());
    // sl.registerLazySingleton(() => ChangePasswordRepository());
    sl.registerLazySingleton(() => GetUserDataRepository());
//app
    sl.registerLazySingleton(() => GetQuestionsRepository());
    sl.registerLazySingleton(() => ProfileRepo());
    sl.registerLazySingleton(() => SubjectsRepository());
    sl.registerLazySingleton(() => ChaptersRepository());
    sl.registerLazySingleton(() => GetUploadedFileRepository());
    sl.registerLazySingleton(() => UploadFileRepository());
    sl.registerLazySingleton(() => GetCustomQuestionsRepository());

    //app
    // sl.registerLazySingleton(() => OpportunitiesRepository());

    ///
    /// DATA SOURCE
    ///
    // Home
    // sl.registerLazySingleton<BaseHomeDataSource>(() => HomeDataSource());

    // sl.registerLazySingleton(() => AccountDetailsRepository());

    /// Other
    sl.registerFactory(() => ThemeManagerController());
    sl.registerLazySingleton(() => NetworkService());
    sl.registerLazySingleton(() => GetStorage());
    sl.registerLazySingleton(() => LogInterceptor(
          request: true,
          error: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        ));
  }
}
