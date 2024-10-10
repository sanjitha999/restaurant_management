import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/di/di_initializer.dart';
import 'package:resturant_management/modules/login/bloc/login_bloc.dart';
import 'package:resturant_management/modules/login/presentation/login_route.dart';
import 'package:resturant_management/modules/login/webservice/login_repository.dart';
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

    default:
      return CupertinoPageRoute(
        builder: (context) => Container(),
      );
  }
}

Route _splashRoute(RouteSettings settings) {
  return CupertinoPageRoute(
    builder: (BuildContext context) => BlocProvider<SplashBloc>(
      create: (context) => SplashBloc(
          // splashRepository: DI.inject<SplashRepository>(),
          // customerDataRepository: DI.inject<CustomerDataRepository>(),
          )
        ..add(FetchInitialData()),
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
