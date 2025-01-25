import 'package:resturant_management/modules/menu_approval/models/menu_approval_response_model.dart';
import 'package:resturant_management/modules/menu_approval/webservice/menu_approval_request.dart';

abstract class MenuApprovalRepository {
  Future<MenuApprovalResponseModel?> approveMenu({required String businessId});
}

class MenuApprovalRepoImpl implements MenuApprovalRepository {
  final MenuApprovalRequest _request = MenuApprovalRequest();

  @override
  Future<MenuApprovalResponseModel?> approveMenu({required String businessId}) {
    return _request.approveMenu(businessId: businessId);
  }
}
