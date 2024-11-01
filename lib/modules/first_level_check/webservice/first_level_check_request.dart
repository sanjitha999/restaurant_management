import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resturant_management/modules/first_level_check/model/first_level_request_model.dart';
import 'package:resturant_management/utils/http_response_utils.dart';
import 'package:resturant_management/webservices/base_request/base_request.dart';
import 'package:resturant_management/webservices/endpoints/endpoints.dart';

class FirstLevelCheckRequest with WebserviceUtils {
  Future<void> submitFirstLevelApproval({
    required FirstLevelRequestModel requestBody,
    required String businessId,
  }) async {
    try {
      final http.Response? response = await constructAndExecuteRequest(
        endpoint: '${EndPoints.firstApprovalCheck}/$businessId',
        method: HttpMethod.post,
        authenticated: true,
        body: jsonEncode(requestBody),
      );

      if (response != null) {
        if (response.isSuccessful()) {
          ///Successful
        } else {
          ///Failed
        }
      }
    } catch (e) {
      throw Exception("Exception in submitting approval");
    }
  }
}
