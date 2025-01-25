
import 'package:resturant_management/modules/admin_onboarding/models/user_onboard_request_model.dart';
import 'package:resturant_management/modules/restaurant_associate_onboard/model/restaurant_associate_response_model.dart';
import 'package:resturant_management/modules/restaurant_associate_onboard/webservices/resturant_associate_onboard_request.dart';

abstract class RestaurantAssociateOnboardRepository {
  Future<RestaurantAssociateResponseModel?> onboardRestaurantAssociate(
      {required UserOnboardRequestModel requestData});
}

class RestaurantAssociateOnboardRepoImpl implements RestaurantAssociateOnboardRepository {
  final RestaurantAssociateOnboardRequest _request = RestaurantAssociateOnboardRequest();

  @override
  Future<RestaurantAssociateResponseModel?> onboardRestaurantAssociate(
      {required UserOnboardRequestModel requestData}) {
    return _request.onboardRestaurantAssociate(requestData: requestData);
  }
}
