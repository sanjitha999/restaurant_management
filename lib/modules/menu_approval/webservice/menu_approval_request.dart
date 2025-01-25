import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resturant_management/modules/menu_approval/models/menu_approval_response_model.dart';
import 'package:resturant_management/utils/http_response_utils.dart';
import 'package:resturant_management/webservices/app_exceptions.dart';
import 'package:resturant_management/webservices/base_request/base_request.dart';
import 'package:resturant_management/webservices/endpoints/endpoints.dart';

class MenuApprovalRequest with WebserviceUtils {
  Future<MenuApprovalResponseModel?> approveMenu(
      {required String businessId}) async {
    final http.Response? response = await constructAndExecuteRequest(
      endpoint: EndPoints.approveMenu(businessId),
      method: HttpMethod.post,
      authenticated: true,
    );

    if (response != null) {
      if (response.isSuccessful()) {
        final json = jsonDecode(response.body);
        MenuApprovalResponseModel menuApprovalResponse =
            MenuApprovalResponseModel.fromJson(json['OnBoardBusinessResponse']);
        return menuApprovalResponse;
      } else {
        final json = jsonDecode(response.body);
        MenuApprovalResponseModel menuApprovalResponse =
            MenuApprovalResponseModel.fromJson(json['OnBoardBusinessResponse']);
        throw DisplayMessageException(response);
      }
    }
    return null;
  }
}
