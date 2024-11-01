import 'package:resturant_management/modules/login/model/login_request_model.dart';
import 'package:resturant_management/modules/login/webservice/login_request.dart';

abstract class LoginRepository {
  Future<void> initiateLogin({required LoginRequestModel loginModel});
  Future<void> refreshToken({required String loginBody});
}

class LoginRepoImpl extends LoginRepository {
  final LoginRequest _loginRequest = LoginRequest();

  @override
  Future<void> initiateLogin({required LoginRequestModel loginModel}) {
    return _loginRequest.initiateLogin(loginModel: loginModel);
  }

  @override
  Future<void> refreshToken({required String loginBody}) {
    return _loginRequest.refreshToken(loginBody: loginBody);
  }
}
