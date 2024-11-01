import 'dart:convert';

import 'package:http/http.dart';
import 'package:resturant_management/webservices/model/error_model.dart';

class AppException implements Exception {
  int? statusCode;
  String? message;
  String? errorCode;
  String? errorBody;
  String? displayMessage;

  AppException.noArgs();

  AppException.allArgs(this.statusCode, this.errorBody);

  AppException(Response response)
      : this.allArgs(response.statusCode, response.body);

  static AppException forResponse(Response response) {
    final int statusCode = response.statusCode;
    switch (statusCode) {
      case 400:
        return UnAuthorizedException(response);
      case 304:
        return ConfigNotModifiedException(response);

      case 477:
        return DisplayMessageException(response);

      case 500:
        return InternalServerException(response);

      case 502:
        return InternalServerException(response);

      case 404:
        return FileNotFoundException(response);

      default:
        return AppException(response);
    }
  }
}

class ConfigNotModifiedException extends AppException {
  ConfigNotModifiedException(super.response);
}

class FileNotFoundException extends AppException {
  FileNotFoundException(super.response);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException(super.response);
}

class DisplayMessageException extends AppException {
  DisplayMessageException(Response response) : super(response) {
    ErrorModel responseStatus =
    ErrorModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    errorCode = responseStatus.error?.errorCode;

    String? errorType = responseStatus.error?.type;

    if (errorType == "displayMessage") {
      displayMessage = responseStatus.error?.message;
    } else {
      message = responseStatus.error?.message;
    }
  }
}

class InternalServerException extends AppException {
  InternalServerException(Response response) : super(response) {
    displayMessage =
    'We ran into an unexpected error. We’re trying to resolve it. Please retry after sometime.';
  }
}
