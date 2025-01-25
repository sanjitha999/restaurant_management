import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:resturant_management/modules/admin_onboarding/webservices/admin_onboard_repository.dart';
import 'package:resturant_management/modules/admins_list_screen/webservice/admin_list_repository.dart';
import 'package:resturant_management/modules/business_overview/webservices/business_overview_repository.dart';
import 'package:resturant_management/modules/dashboard/webservice/master_sync_repo.dart';
import 'package:resturant_management/modules/first_level_check/webservice/first_level_check_repository.dart';
import 'package:resturant_management/modules/license_upload/webservice/certificate_upload_repository.dart';
import 'package:resturant_management/modules/login/webservice/login_repository.dart';
import 'package:resturant_management/modules/menu_approval/webservice/menu_approval_repository.dart';
import 'package:resturant_management/modules/menu_item_addition/webservice/menu_item_add_repo.dart';
import 'package:resturant_management/modules/menu_list_screen/webservices/menu_list_repository.dart';
import 'package:resturant_management/modules/restaurant_associate_onboard/webservices/restaurant_associate_onboard_repository.dart';
import 'package:resturant_management/modules/restaurant_associates/webservice/restaurant_associates_repository.dart';
import 'package:resturant_management/modules/resturant_list_screen/webservice/restaurant_list_repository.dart';
import 'package:resturant_management/modules/resturant_onboarding/webservice/restaurant_onboard_repository.dart';
import 'package:resturant_management/storage/app_shared_preferences.dart';

class AppDI {
  const AppDI();

  factory AppDI.initialize() {
    _addDependency<LoginRepository>(
      object: LoginRepoImpl(),
      isSingleton: true,
    );

    _addDependency<MasterSyncRepository>(
      object: MasterSyncRepoImpl(),
      isSingleton: true,
    );

    _addDependency<Preferences>(
      object: AppPreferenceImpl(),
      isSingleton: true,
    );

    _addDependency<RestaurantOnboardRepository>(
      object: RestaurantOnboardRepoImpl(),
      isSingleton: true,
    );

    _addDependency<CertificateUploadRepository>(
      object: CertificateUploadRepoImpl(),
      isSingleton: true,
    );

    _addDependency<FirstLevelCheckRepository>(
      object: FirstLevelCheckRepoImpl(),
      isSingleton: true,
    );

    _addDependency<BusinessOverviewRepository>(
      object: BusinessOverviewRepoImpl(),
      isSingleton: true,
    );

    _addDependency<RestaurantListRepository>(
      object: RestaurantListRepoImpl(),
      isSingleton: true,
    );

    _addDependency<MenuItemRepository>(
      object: MenuItemRepoImpl(),
      isSingleton: true,
    );

    _addDependency<MenuListRepository>(
      object: MenuListRepoImpl(),
      isSingleton: true,
    );

    _addDependency<MenuApprovalRepository>(
      object: MenuApprovalRepoImpl(),
      isSingleton: true,
    );

    _addDependency<AdminListRepository>(
      object: AdminListRepoImpl(),
      isSingleton: true,
    );

    _addDependency<AdminOnboardRepository>(
      object: AdminOnboardRepoImpl(),
      isSingleton: true,
    );

    _addDependency<RestaurantAssociateOnboardRepository>(
      object: RestaurantAssociateOnboardRepoImpl(),
      isSingleton: true,
    );

    _addDependency<RestaurantAssociatesRepository>(
      object: RestaurantAssociatesRepoImpl(),
      isSingleton: true,
    );

    return const AppDI();
  }

  static void _addDependency<T>({
    required T object,
    required bool isSingleton,
  }) {
    Injector(injectorName)
        .map<T>((injector) => object, isSingleton: isSingleton);
  }

  static T inject<T>() {
    return Injector(injectorName).get<T>();
  }

  static const String injectorName = "restaurant_management";
}
