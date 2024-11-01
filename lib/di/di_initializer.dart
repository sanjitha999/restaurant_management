import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:resturant_management/modules/business_overview/webservices/business_overview_repository.dart';
import 'package:resturant_management/modules/dashboard/webservice/master_sync_repo.dart';
import 'package:resturant_management/modules/first_level_check/webservice/first_level_check_repository.dart';
import 'package:resturant_management/modules/license_upload/webservice/certificate_upload_repository.dart';
import 'package:resturant_management/modules/login/webservice/login_repository.dart';
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
      // object: BusinessOverviewMock(),
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
