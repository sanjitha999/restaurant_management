import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resturant_management/utils/http_response_utils.dart';
import 'package:resturant_management/webservices/base_request/base_request.dart';
import 'package:resturant_management/webservices/endpoints/endpoints.dart';

class BusinessOverviewRequest with WebserviceUtils {
  Future<Map<String, dynamic>?> getBusinessDetails(
      {required String businessId}) async {
    try {
      final http.Response? response = await constructAndExecuteRequest(
        endpoint: '${EndPoints.getBusiness}/$businessId',
        method: HttpMethod.get,
        authenticated: true,
      );

      if (response != null) {
        if (response.isSuccessful()) {
          final Map<String, dynamic> businessResponseMap =
              jsonDecode(response.body);

          return businessResponseMap;
        } else {
          throw Exception('Exception getting overview');
        }
      }
    } catch (e) {
      throw Exception('Exception getting overview $e');
    }
    return null;
  }

  Future<void> approveRestaurant({required String businessId}) async {
    try {
      final http.Response? response = await constructAndExecuteRequest(
        endpoint: EndPoints.approveBusiness(businessId),
        method: HttpMethod.post,
        authenticated: true,
      );

      if (response != null) {
        if (response.isSuccessful()) {
        }
      }
    } catch (e) {
      throw Exception('Exception approving business $e');
    }
  }

  Future<void> rejectRestaurant({required String businessId}) async {
    final http.Response? response = await constructAndExecuteRequest(
      endpoint: EndPoints.rejectBusiness(businessId),
      authenticated: true,
      method: HttpMethod.post,
    );

    if (response != null && response.isSuccessful()) {
     debugPrint('response ${response.body}');
    } else {
      throw Exception('Exception rejecting business ${response?.reasonPhrase}');
    }
  }
}
