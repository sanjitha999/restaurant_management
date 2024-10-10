import 'package:resturant_management/modules/login/model/login_request_model.dart';
import 'package:resturant_management/modules/login/webservice/login_request.dart';

abstract class LoginRepository {
  Future<void> initiateLogin({required LoginRequestModel loginModel});
}

class LoginRepoImpl extends LoginRepository {
  final LoginRequest _loginRequest = LoginRequest();

  @override
  Future<void> initiateLogin({required LoginRequestModel loginModel}) {
    return _loginRequest.initiateLogin(loginModel: loginModel);
  }
}
