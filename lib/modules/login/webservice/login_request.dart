import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resturant_management/di/di_initializer.dart';
import 'package:resturant_management/modules/login/model/login_request_model.dart';
import 'package:resturant_management/modules/login/model/login_response_model.dart';
import 'package:resturant_management/storage/app_shared_preferences.dart';
import 'package:resturant_management/utils/http_response_utils.dart';
import 'package:resturant_management/webservices/base_request/base_request.dart';
import 'package:resturant_management/webservices/endpoints/endpoints.dart';

class LoginRequest with WebserviceUtils {
  Future<void> initiateLogin({required LoginRequestModel loginModel}) async {
    try {
      final loginRequestBody = LoginRequestWrapper(
        loginRequest: LoginRequestModel(
          username: loginModel.username,
          password: loginModel.password,
        ),
      );

      final http.Response? response = await constructAndExecuteRequest(
        endpoint: EndPoints.login,
        body: jsonEncode(loginRequestBody),
        authenticated: false,
        method: HttpMethod.post,
      );
      if (response != null) {
        if (response.isSuccessful()) {
          final LoginResponseModel loginResponse =
              LoginResponseModel.fromJson(jsonDecode(response.body));
          final String? authToken = loginResponse.loginResponse.token;
          if (authToken != null) {
            final Preferences prefs = AppDI.inject<Preferences>();
            prefs.setAuthToken(authToken);
            prefs.setLoginData(jsonEncode(loginRequestBody));
          }
          return;
        } else {
          final LoginResponseModel loginResponse =
              LoginResponseModel.fromJson(jsonDecode(response.body));
          throw Exception("Invalid Credentials");
          // throw AppException.forResponse(response);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> refreshToken({required String loginBody}) async {
    print("JsonBody $loginBody");
    try {
      final http.Response? response = await constructAndExecuteRequest(
        endpoint: EndPoints.login,
        body: loginBody,
        authenticated: false,
        method: HttpMethod.post,
      );

      if (response != null) {
        if (response.isSuccessful()) {
          final LoginResponseModel loginResponse =
              LoginResponseModel.fromJson(jsonDecode(response.body));
          final String? authToken = loginResponse.loginResponse.token;
          if (authToken != null) {
            final Preferences prefs = AppDI.inject<Preferences>();
            prefs.setAuthToken(authToken);
          }
          return;
        } else {
          final LoginResponseModel loginResponse =
              LoginResponseModel.fromJson(jsonDecode(response.body));
          throw Exception("Invalid Credentials");
          // throw AppException.forResponse(response);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
