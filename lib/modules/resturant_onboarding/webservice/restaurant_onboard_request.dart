import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resturant_management/modules/resturant_onboarding/model/onboard_business_model.dart';
import 'package:resturant_management/modules/resturant_onboarding/model/submit_restaurant_response_model.dart';
import 'package:resturant_management/utils/http_response_utils.dart';
import 'package:resturant_management/webservices/base_request/base_request.dart';
import 'package:resturant_management/webservices/endpoints/endpoints.dart';

class RestaurantOnboardRequest with WebserviceUtils {
  Future<SubmitRestaurantResponse?> submitRestaurantDetails({
    required OnBoardBusinessModel onboardBusinessModel,
  }) async {
    try {
      final http.Response? response = await constructAndExecuteRequest(
        endpoint: EndPoints.restaurantOnboard,
        method: HttpMethod.post,
        authenticated: true,
        body: jsonEncode(onboardBusinessModel.toJson()),
      );

      if (response != null) {
        if (response.isSuccessful()) {
          final SubmitRestaurantResponse submitRestaurantResponse =
              SubmitRestaurantResponse.fromJson(jsonDecode(response.body));

          return submitRestaurantResponse;
        }
      } else {
        throw Exception('Exception creating restraunt');
      }
    } catch (e) {
      throw Exception('Exception creating restraunt $e');
    }
    return null;
  }
}
