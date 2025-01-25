import 'package:flutter/foundation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:resturant_management/di/di_initializer.dart';
import 'package:resturant_management/modules/login/webservice/login_repository.dart';
import 'package:resturant_management/storage/app_shared_preferences.dart';
import 'package:resturant_management/utils/string_utils.dart';

class AuthManager {
  static final AuthManager _instance = AuthManager._internal();

  factory AuthManager() {
    return _instance;
  }

  final LoginRepository _repository = AppDI.inject<LoginRepository>();

  AuthManager._internal();

  final Preferences prefs = AppDI.inject<Preferences>();

  Future<String?> getAuthToken() async {
    String? prevAuthToken = await prefs.getAuthToken();
    return prevAuthToken;
  }

  Future<String>? refreshAuthToken() async {
    return "";
  }

  Future<bool> isAuthenticated() async {
    String? prevAuthToken = await prefs.getAuthToken();
    if (prevAuthToken == null) return false;
    const autoLogin = String.fromEnvironment('AUTO_LOGIN', defaultValue: 'default_value');
    if (autoLogin == 'true') {
      return await _autoLogin(prevAuthToken);
    } else {
      return !_isTokenExpired(prevAuthToken);
    }
    // if (_isTokenExpired(prevAuthToken)) {
    //   return false;
    // } else {
    //   return true;
    // }
    // if (_isTokenExpired(prevAuthToken ?? '')) {
    //   String? loginData = await prefs.getLoginData();
    //   if (kDebugMode) {
    //    debugPrint("loginData $loginData");
    //   }
    //   if (loginData == null) return false;
    //   await _repository.refreshToken(loginBody: loginData);
    //   prevAuthToken = await prefs.getAuthToken();
    // }
    // if (kDebugMode) {
    //  debugPrint("prevAUthToken $prevAuthToken");
    // }
    // return !StringUtils.isNullOrEmpty(prevAuthToken);
  }

  bool _isTokenExpired(String token) {
    // Check if the token is expired
    bool isTokenExpired = JwtDecoder.isExpired(token);
    return isTokenExpired;
  }

  Future<bool> _autoLogin(String? prevAuthToken) async {
    if (_isTokenExpired(prevAuthToken ?? '')) {
      String? loginData = await prefs.getLoginData();
      if (kDebugMode) {
       debugPrint("loginData $loginData");
      }
      if (loginData == null) return false;
      await _repository.refreshToken(loginBody: loginData);
      prevAuthToken = await prefs.getAuthToken();
    }
    if (kDebugMode) {
     debugPrint("prevAUthToken $prevAuthToken");
    }
    return !StringUtils.isNullOrEmpty(prevAuthToken);
  }
}
