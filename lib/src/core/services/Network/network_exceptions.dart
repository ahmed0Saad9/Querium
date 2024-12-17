import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:querium/src/Features/AuthFeature/LogIn/Ui/Screens/login_screen.dart';
// import 'package:querium/src/Features/AuthFeature/LogIn/Ui/Screens/login_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/SnackBar/custom_toast.dart';
import 'package:querium/src/core/constants/app_assets.dart';
import 'package:querium/src/core/services/Network/models/error.dart';
import 'package:querium/src/core/services/services_locator.dart';
import 'package:querium/src/core/utils/network_exceptions.dart';
import 'package:querium/src/core/utils/request_status.dart';

part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorizedRequest(String reason) =
      UnauthorizedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions handleResponse(Response? response) {
    ErrorModel? errorModel;

    try {
      errorModel = ErrorModel.fromJson(response?.data);
    } catch (e) {
      printDM(e.toString());
    }

    int statusCode = response?.statusCode ?? 0;
    switch (statusCode) {
      case 302:
        return const NetworkExceptions.defaultError("Error 302");
      case 401:
      case 403:
        return NetworkExceptions.unauthorizedRequest(
            errorModel?.statusMessage ?? "You are not unauthorized");
      case 404:
        return NetworkExceptions.notFound(
            errorModel?.statusMessage ?? "Not Found");
      case 409:
        return const NetworkExceptions.conflict();
      case 408:
        return const NetworkExceptions.requestTimeout();
      case 422:
        return NetworkExceptions.defaultError(errorModel!.statusMessage);
      case 500:
        return const NetworkExceptions.internalServerError();
      case 503:
        return const NetworkExceptions.serviceUnavailable();
      default:
        var responseCode = statusCode;
        return NetworkExceptions.defaultError(
          "Received invalid status code: $responseCode",
        );
    }
  }

  static NetworkExceptions getDioException(error) {
    printDM("error is DioErrorType.response => ${error.runtimeType}");
    if (error is Exception) {
      printDM('===============>0 ${error}');
      try {
        NetworkExceptions networkExceptions;
        if (error is DioError) {
          printDM("error is error.type => ${error.type}");
          switch (error.type) {
            case DioErrorType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioErrorType.connectTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
            case DioErrorType.other:
              networkExceptions =
                  const NetworkExceptions.noInternetConnection();
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioErrorType.response:
              networkExceptions =
                  NetworkExceptions.handleResponse(error.response);
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
          }
        } else if (error is NetworkDisconnectException) {
          return const NetworkExceptions.noInternetConnection();
        } else if (error is SocketException) {
          printDM("error is SocketException");
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (e) {
        printDM("FormatException is => $e");
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(notImplemented: () {
      errorMessage = "Not Implemented";
    }, requestCancelled: () {
      errorMessage = "Request Cancelled";
    }, internalServerError: () {
      errorMessage = "Internal Server Error";
    }, notFound: (String reason) {
      errorMessage = reason;
    }, serviceUnavailable: () {
      errorMessage = "Service unavailable";
    }, methodNotAllowed: () {
      errorMessage = "Method Allowed";
    }, badRequest: () {
      errorMessage = "Bad request";
    }, unauthorizedRequest: (String error) {
      errorMessage = error;
    }, unexpectedError: () {
      errorMessage = "Unexpected error occurred";
    }, requestTimeout: () {
      errorMessage = "Connection request timeout";
    }, noInternetConnection: () {
      errorMessage = "No internet connection";
    }, conflict: () {
      errorMessage = "Error due to a conflict";
    }, sendTimeout: () {
      errorMessage = "Send timeout in connection with API server";
    }, unableToProcess: () {
      errorMessage = "Unable to process the data";
    }, defaultError: (String error) {
      errorMessage = error;
    }, formatException: () {
      errorMessage = "Unexpected error occurred";
    }, notAcceptable: () {
      errorMessage = "Not acceptable";
    });
    return errorMessage;
  }
}

RequestStatus actionNetworkExceptions(NetworkExceptions e) {
  if (e is DefaultError) {
    showToast(e.error, isError: true);
    return RequestStatus.done;
  } else if (e ==
      NetworkExceptions.unauthorizedRequest(
          NetworkExceptions.getErrorMessage(e))) {
    sl<GetStorage>().erase();
    Get.offAll(() => const LoginScreen());
    showToast(NetworkExceptions.getErrorMessage(e), isError: true);
    return RequestStatus.unauthorized;
  } else if (e == const NetworkExceptions.noInternetConnection()) {
    showToast(NetworkExceptions.getErrorMessage(e), isError: true);
    return RequestStatus.unauthorized;
  } else if (e == const NetworkExceptions.noInternetConnection()) {
    showToast(NetworkExceptions.getErrorMessage(e), isError: true);
    return RequestStatus.connectionError;
  } else {
    showToast(NetworkExceptions.getErrorMessage(e), isError: true);
    return RequestStatus.serverError;
  }
}
