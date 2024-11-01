import 'package:resturant_management/modules/resturant_onboarding/model/onboard_business_model.dart';
import 'package:resturant_management/modules/resturant_onboarding/model/submit_restaurant_response_model.dart';
import 'package:resturant_management/modules/resturant_onboarding/webservice/restaurant_onboard_request.dart';

abstract class RestaurantOnboardRepository {
  Future<SubmitRestaurantResponse?> submitRestaurantDetails(
      {required OnBoardBusinessModel onboardBusinessModel});
}

class RestaurantOnboardRepoImpl extends RestaurantOnboardRepository {
  final RestaurantOnboardRequest _request = RestaurantOnboardRequest();

  @override
  Future<SubmitRestaurantResponse?> submitRestaurantDetails(
      {required OnBoardBusinessModel onboardBusinessModel}) {
    return _request.submitRestaurantDetails(
        onboardBusinessModel: onboardBusinessModel);
  }
}
