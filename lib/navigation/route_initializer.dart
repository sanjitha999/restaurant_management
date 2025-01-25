
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/di/di_initializer.dart';
import 'package:resturant_management/modules/admin_onboarding/bloc/admin_onboarding_bloc.dart';
import 'package:resturant_management/modules/admin_onboarding/presentation/admin_onboarding_screen.dart';
import 'package:resturant_management/modules/admin_onboarding/webservices/admin_onboard_repository.dart';
import 'package:resturant_management/modules/business_overview/bloc/business_overview_bloc.dart';
import 'package:resturant_management/modules/business_overview/model/business_screen_args_model.dart';
import 'package:resturant_management/modules/business_overview/presentation/business_overview_route.dart';
import 'package:resturant_management/modules/business_overview/webservices/business_overview_repository.dart';
import 'package:resturant_management/modules/dashboard/bloc/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:resturant_management/modules/dashboard/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:resturant_management/modules/dashboard/presentation/dashboard_route.dart';
import 'package:resturant_management/modules/dashboard/webservice/master_sync_repo.dart';
import 'package:resturant_management/modules/first_level_check/bloc/first_level_check_bloc.dart';
import 'package:resturant_management/modules/first_level_check/presentation/first_level_check_route.dart';
import 'package:resturant_management/modules/first_level_check/webservice/first_level_check_repository.dart';
import 'package:resturant_management/modules/license_upload/bloc/license_upload_bloc.dart';
import 'package:resturant_management/modules/license_upload/presentation/license_upload_route.dart';
import 'package:resturant_management/modules/license_upload/webservice/certificate_upload_repository.dart';
import 'package:resturant_management/modules/location_picker/bloc/location_picker_bloc.dart';
import 'package:resturant_management/modules/location_picker/presentation/location_picker_widget.dart';
import 'package:resturant_management/modules/login/bloc/login_bloc.dart';
import 'package:resturant_management/modules/login/presentation/login_route.dart';
import 'package:resturant_management/modules/login/webservice/login_repository.dart';
import 'package:resturant_management/modules/menu_approval/bloc/menu_approval_bloc.dart';
import 'package:resturant_management/modules/menu_approval/presentation/menu_approval_screen.dart';
import 'package:resturant_management/modules/menu_approval/webservice/menu_approval_repository.dart';
import 'package:resturant_management/modules/menu_item_addition/bloc/menu_item_add_bloc.dart';
import 'package:resturant_management/modules/menu_item_addition/presentation/menu_item_add_route.dart';
import 'package:resturant_management/modules/menu_item_addition/webservice/menu_item_add_repo.dart';
import 'package:resturant_management/modules/menu_list_screen/model/menu_item_model.dart';
import 'package:resturant_management/modules/menu_list_screen/presentation/component/menu_item_details_route.dart';
import 'package:resturant_management/modules/restaurant_associate_onboard/bloc/restaurant_associate_onboard_bloc.dart';
import 'package:resturant_management/modules/restaurant_associate_onboard/presentation/restaurant_associate_onboard_screen.dart';
import 'package:resturant_management/modules/restaurant_associate_onboard/webservices/restaurant_associate_onboard_repository.dart';
import 'package:resturant_management/modules/restaurant_dashboard/bloc/res_nav_bar_bloc/res_nav_bar_bloc.dart';
import 'package:resturant_management/modules/restaurant_dashboard/presentation/restaurant_dashboard.dart';
import 'package:resturant_management/modules/resturant_onboarding/bloc/restaurant_onboarding_bloc.dart';
import 'package:resturant_management/modules/resturant_onboarding/model/submit_restaurant_response_model.dart';
import 'package:resturant_management/modules/resturant_onboarding/presentation/restaurant_onboarding_route.dart';
import 'package:resturant_management/modules/resturant_onboarding/webservice/restaurant_onboard_repository.dart';
import 'package:resturant_management/modules/splash/bloc/splash_bloc.dart';
import 'package:resturant_management/modules/splash/splash_screen.dart';
import 'package:resturant_management/navigation/routes.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashRoute:
      return _splashRoute(settings);

    case Routes.loginRoute:
      return _loginRoute(settings);

    case Routes.dashboardRoute:
      return _dashboardRoute(settings);

    case Routes.restaurantOnboardingRoute:
      return _restaurantOnboardingRoute(settings);

    case Routes.locationPickerRoute:
      return _locationPickerRoute(settings);

    case Routes.licenseUploadRoute:
      return _licenseUploadRoute(settings);

    case Routes.firstLevelCheckRoute:
      return _firstLevelCheckRoute(settings);

    case Routes.businessOverviewRoute:
      return _businessOverviewRoute(settings);

    case Routes.restaurantDashboardRoute:
      return _restaurantDashboardRoute(settings);

    case Routes.menuItemAddRoute:
      return _menuItemAddRoute(settings);

    case Routes.menuApprovalRoute:
      return _menuApprovalRoute(settings);

    case Routes.menuItemDetailsRoute:
      return _menuItemDetailsRoute(settings);

    case Routes.adminOnboardingRoute:
      return _adminOnboardingRoute(settings);

    case Routes.restaurantAssociatesRoute:
      return _restaurantAssociatesRoute(settings);
    default:
      return CupertinoPageRoute(
        builder: (context) => Container(),
      );
  }
}

Route _restaurantAssociatesRoute(RouteSettings settings) {
  final String businessId = settings.arguments as String;
  return CupertinoPageRoute(
    builder: (context) => BlocProvider(
      create: (context) => RestaurantAssociateOnboardBloc(
        repository: AppDI.inject<RestaurantAssociateOnboardRepository>(),
        businessId: businessId,
      ),
      child: const RestaurantAssociateOnboardScreen(),
    ),
  );
}

Route _adminOnboardingRoute(RouteSettings settings) {
  return CupertinoPageRoute(
    builder: (context) => BlocProvider(
      create: (context) => AdminOnboardingBloc(
        repository: AppDI.inject<AdminOnboardRepository>(),
      ),
      child: const AdminOnboardingScreen(),
    ),
  );
}

Route _menuItemDetailsRoute(RouteSettings settings) {
  List argList = settings.arguments as List;
  final MenuItemDisplayModel menuItem = argList[0] as MenuItemDisplayModel;
  final Uint8List? image = argList[1] as Uint8List?;
  return CupertinoPageRoute(
    builder: (context) => MenuItemDetailsRoute(
      menuItem: menuItem,
      image: image,
    ),
  );
}

Route _menuApprovalRoute(RouteSettings settings) {
  final String? args = settings.arguments as String?;
  return CupertinoPageRoute(
    builder: (context) => BlocProvider(
      create: (context) => MenuApprovalBloc(
        repository: AppDI.inject<MenuApprovalRepository>(),
        businessId: args ?? '',
      )..add(FetchApprovalListEvent()),
      child: MenuApprovalScreen(
        businessID: args ?? '',
      ),
    ),
  );
}

Route _menuItemAddRoute(RouteSettings settings) {
  final String? args = settings.arguments as String?;
  return CupertinoPageRoute(
    builder: (context) => BlocProvider(
      create: (context) => MenuItemAddBloc(
          businessId: args ?? '',
          repository: AppDI.inject<MenuItemRepository>()),
      child: const MenuItemAddRoute(),
    ),
  );
}

Route _restaurantDashboardRoute(RouteSettings settings) {
  final String? args = settings.arguments as String?;
  return CupertinoPageRoute(
    builder: (context) => BlocProvider(
      create: (context) => ResNavBarBloc(),
      child: RestaurantDashboard(
        businessId: args ?? '',
      ),
    ),
  );
}

Route _businessOverviewRoute(RouteSettings settings) {
  final BusinessScreenArgsModel? args =
      settings.arguments as BusinessScreenArgsModel?;
  return CupertinoPageRoute(
    builder: (context) => BlocProvider(
      create: (context) => BusinessOverviewBloc(
        repository: AppDI.inject<BusinessOverviewRepository>(),
        businessId: args?.businessId ?? '',
      )..add(FetchBusinessOverviewEvent()),
      child: BusinessOverviewRoute(
        isPendingPage: args?.isPending ?? false,
      ),
    ),
  );
}

Route _firstLevelCheckRoute(RouteSettings settings) {
  final String? businessId = settings.arguments as String?;
  return CupertinoPageRoute(
    builder: (context) => BlocProvider<FirstLevelCheckBloc>(
      create: (context) => FirstLevelCheckBloc(
        businessId: businessId ?? '',
        firstLevelCheckRepository: AppDI.inject<FirstLevelCheckRepository>(),
      )..add(FetchCheckDataEvent()),
      child: const FirstLevelCheckRoute(),
    ),
  );
}

Route _licenseUploadRoute(RouteSettings settings) {
  final SubmitRestaurantResponse? restaurantResponse =
      settings.arguments as SubmitRestaurantResponse?;
  return CupertinoPageRoute(
    builder: (context) => BlocProvider(
      create: (context) => LicenseUploadBloc(
        businessId: restaurantResponse?.onBoardBusinessResponse.id ?? '',
        certificateUploadRepository:
            AppDI.inject<CertificateUploadRepository>(),
      )..add(FetchLicenseListEvent()),
      child: const LicenseUploadRoute(),
    ),
  );
}

Route _locationPickerRoute(RouteSettings settings) {
  return CupertinoPageRoute(
    builder: (context) => BlocProvider<LocationPickerBloc>(
      create: (context) => LocationPickerBloc(),
      child: const LocationPickerWidget(),
    ),
  );
}

Route _splashRoute(RouteSettings settings) {
  return CupertinoPageRoute(
    builder: (BuildContext context) => BlocProvider<SplashBloc>(
      create: (context) => SplashBloc()..add(FetchInitialData()),
      child: const SplashScreen(),
    ),
  );
}

Route _loginRoute(RouteSettings settings) {
  return CupertinoPageRoute(
    builder: (context) => BlocProvider(
      create: (context) => LoginBloc(
        loginRepository: AppDI.inject<LoginRepository>(),
      ),
      child: const LoginRoute(),
    ),
  );
}

Route _dashboardRoute(RouteSettings settings) {
  return CupertinoPageRoute(
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DashboardBloc(
            masterSyncRepository: AppDI.inject<MasterSyncRepository>(),
          )..add(FetchDashboardDataEvent()),
        ),
        BlocProvider(
          create: (context) => BottomNavBloc(),
        ),
      ],
      child: const DashboardRoute(),
    ),
  );
}

Route _restaurantOnboardingRoute(RouteSettings settings) {
  return CupertinoModalPopupRoute(
    builder: (context) => BlocProvider(
      create: (context) => RestaurantOnboardingBloc(
        restaurantOnboardRepository:
            AppDI.inject<RestaurantOnboardRepository>(),
      )..add(
          RestaurantOnboardFetchInitialData(),
        ),
      child: const RestaurantOnboardingRoute(),
    ),
  );
}
