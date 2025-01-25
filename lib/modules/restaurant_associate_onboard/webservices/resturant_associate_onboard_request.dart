import 'dart:convert';

import 'package:resturant_management/modules/admin_onboarding/models/user_onboard_request_model.dart';
import 'package:resturant_management/modules/restaurant_associate_onboard/model/restaurant_associate_response_model.dart';
import 'package:resturant_management/webservices/base_request/base_request.dart';
import 'package:http/http.dart' as http;
import 'package:resturant_management/webservices/endpoints/endpoints.dart';
class RestaurantAssociateOnboardRequest with WebserviceUtils {
  Future<RestaurantAssociateResponseModel?> onboardRestaurantAssociate({required UserOnboardRequestModel requestData}) async {
    final http.Response? response = await constructAndExecuteRequest(
      endpoint: EndPoints.restaurantAssociateOnboard,
      authenticated: true,
      method: HttpMethod.post,
      body: jsonEncode({'UserSignUpRequest': requestData.toJson()}),
    );
    if (response != null) {
      final RestaurantAssociateResponseModel adminCreateResponse =
      RestaurantAssociateResponseModel.fromJson(jsonDecode(response.body)['UserSignUpResponse']);
      return adminCreateResponse;
    } else {
    }
    return null;
  }
}