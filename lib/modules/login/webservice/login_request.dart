import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resturant_management/modules/login/model/login_request_model.dart';
import 'package:resturant_management/modules/login/model/login_response_model.dart';
import 'package:resturant_management/storage/app_shared_preferences.dart';
import 'package:resturant_management/utils/http_response_utils.dart';
import 'package:resturant_management/webservices/app_exceptions.dart';
import 'package:resturant_management/webservices/base_request/base_request.dart';
import 'package:resturant_management/webservices/endpoints/endpoints.dart';

class LoginRequest with WebserviceUtils {
  Future<void> initiateLogin({required LoginRequestModel loginModel}) async {
    try {
      final loginRequest = LoginRequestModel(
        username: loginModel.username,
        password: loginModel.password,
      );
      // final Map<String, dynamic> requestBody = {
      //   "LoginRequest": {
      //     "username": loginModel.username,
      //     "password": loginModel.password
      //   }
      // };
      final http.Response? response = await constructAndExecuteRequest(
        endpoint: EndPoints.login,
        body: jsonEncode(loginRequest),
        authenticated: false,
        method: HttpMethod.post,
      );
      if (response != null) {
        if (response.isSuccessful()) {
          final LoginResponseModel loginResponse =
              LoginResponseModel.fromJson(jsonDecode(response.body));
          final String authToken = loginResponse.loginResponse.token;
          AppSharedPreferences()
              .setStringForKey(PreferencesKeys.kAuthToken, authToken);
          return;
        } else {
          throw AppException.forResponse(response);
        }
      }
    } catch (e) {
      throw Exception(e);
    }

    // // final Map<String, String> headers = {
    // //   Header.contentType: Header.contentTypeJson, // Adjust as needed
    // // };
    // //
    // // try {
    // //   final response = await http.post(
    // //       Uri.parse(EndPoints.baseUrl + EndPoints.login),
    // //       headers: headers,
    // //       body: jsonEncode(requestBody));
    // //
    // //   if (response.statusCode == 200) {
    // //     final jsonResponse = jsonDecode(response.body);
    // //     final LoginResponseModel loginResponse =
    // //         LoginResponseModel.fromJson(jsonResponse);
    // //     final String authToken = loginResponse.loginResponse.token;
    // //
    // //     print('Auth Token: ${authToken}');
    // //     AppSharedPreferences()
    // //         .setStringForKey(PreferencesKeys.kAuthToken, authToken);
    // //     return authToken;
    //   } else {
    //     print('Request failed with status: ${response.statusCode}');
    //   }
    // } catch (e) {
    //   print('Error occurred: $e');
    // }
  }
}
