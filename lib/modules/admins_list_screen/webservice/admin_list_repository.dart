import 'package:resturant_management/modules/admins_list_screen/models/business_user_models.dart';
import 'package:resturant_management/modules/admins_list_screen/webservice/admin_list_request.dart';

abstract class AdminListRepository {
  Future<List<BusinessUser>?> getAdminList();
}

class AdminListRepoImpl implements AdminListRepository {
  final AdminListRequest _request = AdminListRequest();

  @override
  Future<List<BusinessUser>?> getAdminList() async {
    return _request.getAdminList();
  }
}
