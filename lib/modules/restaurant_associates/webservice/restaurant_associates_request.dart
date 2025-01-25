import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resturant_management/modules/admins_list_screen/models/business_user_models.dart';
import 'package:resturant_management/utils/http_response_utils.dart';
import 'package:resturant_management/webservices/base_request/base_request.dart';
import 'package:resturant_management/webservices/endpoints/endpoints.dart';

class RestaurantAssociatesRequest with WebserviceUtils {
  Future<List<BusinessUser>?> getAssociatesList() async {
    final http.Response? response = await constructAndExecuteRequest(
      endpoint: EndPoints.getBusinessUserList,
      authenticated: true,
      method: HttpMethod.get,
    );

    if (response != null) {
      if (response.isSuccessful()) {
        final BusinessUserListResponse? userListResponse =
            BusinessUserListResponse.fromJson(
                jsonDecode(response.body)['BusinessUserListResponse']);
        return userListResponse?.businessList;
      } else {
      }
    }
    return null;
  }
}
