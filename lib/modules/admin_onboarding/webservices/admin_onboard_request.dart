import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resturant_management/modules/admin_onboarding/models/user_onboard_request_model.dart';
import 'package:resturant_management/modules/admins_list_screen/models/admin_create_response_model.dart';
import 'package:resturant_management/utils/http_response_utils.dart';
import 'package:resturant_management/webservices/base_request/base_request.dart';
import 'package:resturant_management/webservices/endpoints/endpoints.dart';

class AdminOnboardRequest with WebserviceUtils {
  Future<AdminCreateResponseModel?> onboardAdmin(
      {required UserOnboardRequestModel requestData}) async {
    final http.Response? response = await constructAndExecuteRequest(
      endpoint: EndPoints.adminOnboard,
      authenticated: true,
      method: HttpMethod.post,
      body: jsonEncode({'UserSignUpRequest': requestData.toJson()}),
    );
    if (response != null) {
      final AdminCreateResponseModel adminCreateResponse =
          AdminCreateResponseModel.fromJson(jsonDecode(response.body)['UserSignUpResponse']);
      return adminCreateResponse;
    } else {
    }
    return null;
  }
}
