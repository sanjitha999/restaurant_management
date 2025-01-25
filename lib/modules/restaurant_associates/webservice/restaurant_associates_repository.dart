import 'package:resturant_management/modules/admins_list_screen/models/business_user_models.dart';
import 'package:resturant_management/modules/restaurant_associates/webservice/restaurant_associates_request.dart';

abstract class RestaurantAssociatesRepository {
  Future<List<BusinessUser>?> getAssociatesList();
}

class RestaurantAssociatesRepoImpl implements RestaurantAssociatesRepository {
  final RestaurantAssociatesRequest _request = RestaurantAssociatesRequest();

  @override
  Future<List<BusinessUser>?> getAssociatesList() async {
    return _request.getAssociatesList();
  }
}
