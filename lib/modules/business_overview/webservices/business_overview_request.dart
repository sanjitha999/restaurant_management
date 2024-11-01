import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resturant_management/utils/http_response_utils.dart';
import 'package:resturant_management/webservices/base_request/base_request.dart';
import 'package:resturant_management/webservices/endpoints/endpoints.dart';

class BusinessOverviewRequest with WebserviceUtils {
  Future<Map<String,dynamic>?> getBusinessDetails({required String businessId}) async {
    try {
      final http.Response? response = await constructAndExecuteRequest(
        endpoint: '${EndPoints.getBusiness}/$businessId',
        method: HttpMethod.get,
        authenticated: true,
      );

      if(response!=null){
        if(response.isSuccessful()){
          final Map<String, dynamic> businessResponseMap = jsonDecode(response.body);

          return businessResponseMap;
        } else{
          throw Exception('Exception getting overview');
        }
      }
    } catch (e) {
      throw Exception('Exception getting overview $e');
    }
    return null;
  }
}
