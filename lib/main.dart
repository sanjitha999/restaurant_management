import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/di/di_initializer.dart';
import 'package:resturant_management/generated/l10n.dart';
import 'package:resturant_management/modules/auth/bloc/auth_bloc.dart';
import 'package:resturant_management/navigation/route_initializer.dart';
import 'package:resturant_management/navigation/routes.dart';
import 'package:resturant_management/theme/app_theme.dart';
import 'package:resturant_management/utils/app_global_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppDI.initialize();
  runApp(
    BlocProvider(
      create: (context) => AuthBloc(),
      child: MyApp(),
    ),
  );
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey:  AppGlobalKeys.navigatorKey,
      localizationsDelegates: const [
        Strings.delegate,
      ],
      navigatorObservers: [routeObserver],
      theme: AppTheme.lightTheme,
      onGenerateRoute: (settings) => onGenerateRoute(settings),
      initialRoute: Routes.splashRoute,
    );
  }
}
