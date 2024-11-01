import 'package:resturant_management/modules/first_level_check/model/first_level_request_model.dart';
import 'package:resturant_management/modules/first_level_check/webservice/first_level_check_request.dart';

abstract class FirstLevelCheckRepository {
  Future<void> submitFirstLevelApproval({
    required FirstLevelRequestModel requestBody,
    required String businessId,
  });
}

class FirstLevelCheckRepoImpl implements FirstLevelCheckRepository {
  final FirstLevelCheckRequest _request = FirstLevelCheckRequest();

  @override
  Future<void> submitFirstLevelApproval({
    required FirstLevelRequestModel requestBody,
    required String businessId,
  }) {
    return _request.submitFirstLevelApproval(
      requestBody: requestBody,
      businessId: businessId,
    );
  }
}
