import 'package:resturant_management/modules/admin_onboarding/models/user_onboard_request_model.dart';
import 'package:resturant_management/modules/admin_onboarding/webservices/admin_onboard_request.dart';
import 'package:resturant_management/modules/admins_list_screen/models/admin_create_response_model.dart';

abstract class AdminOnboardRepository {
  Future<AdminCreateResponseModel?> onboardAdmin(
      {required UserOnboardRequestModel requestData});
}

class AdminOnboardRepoImpl implements AdminOnboardRepository {
  final AdminOnboardRequest _request = AdminOnboardRequest();

  @override
  Future<AdminCreateResponseModel?> onboardAdmin(
      {required UserOnboardRequestModel requestData}) {
    return _request.onboardAdmin(requestData: requestData);
  }
}
