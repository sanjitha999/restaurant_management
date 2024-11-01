import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/di/di_initializer.dart';
import 'package:resturant_management/modules/business_overview/bloc/business_overview_bloc.dart';
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
import 'package:resturant_management/modules/resturant_onboarding/bloc/restaurant_onboarding_bloc.dart';
import 'package:resturant_management/modules/resturant_onboarding/model/submit_restaurant_response_model.dart';
import 'package:resturant_management/modules/resturant_onboarding/presentation/restaurant_onboarding_route.dart';
import 'package:resturant_management/modules/resturant_onboarding/webservice/restaurant_onboard_repository.dart';
import 'package:resturant_management/modules/splash/bloc/splash_bloc.dart';
import 'package:resturant_management/modules/splash/splash_screen.dart';
import 'package:resturant_management/navigation/routes.dart';

Route onGenerateRoute(RouteSettings settings) {
  print("MyTest :: route ${settings.name}");
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

    default:
      return CupertinoPageRoute(
        builder: (context) => Container(),
      );
  }
}

Route _businessOverviewRoute(RouteSettings settings) {
  final String? businessId = settings.arguments as String?;
  return CupertinoPageRoute(
    builder: (context) => BlocProvider(
      create: (context) => BusinessOverviewBloc(
        repository: AppDI.inject<BusinessOverviewRepository>(),
        businessId: businessId ?? '',
      )..add(FetchBusinessOverviewEvent()),
      child: const BusinessOverviewRoute(),
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
