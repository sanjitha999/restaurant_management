import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resturant_management/modules/admins_list_screen/models/business_user_models.dart';
import 'package:resturant_management/utils/http_response_utils.dart';
import 'package:resturant_management/webservices/base_request/base_request.dart';
import 'package:resturant_management/webservices/endpoints/endpoints.dart';

class AdminListRequest with WebserviceUtils {
  Future<List<BusinessUser>?> getAdminList() async {
    final http.Response? response = await constructAndExecuteRequest(
      endpoint: EndPoints.getAdminList,
      method: HttpMethod.get,
      authenticated: true,
    );

    if (response != null) {
      if (response.isSuccessful()) {
        final BusinessUserListResponse? userListResponse =
            BusinessUserListResponse.fromJson(jsonDecode(response.body)['BusinessUserListResponse']);
        return userListResponse?.businessList;
      } else {
      }
    }
    return null;
  }
}
