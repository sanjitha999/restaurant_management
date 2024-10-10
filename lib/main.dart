import 'package:flutter/material.dart';
import 'package:resturant_management/auth/auth_manager.dart';
import 'package:resturant_management/di/di_initializer.dart';
import 'package:resturant_management/navigation/route_initializer.dart';
import 'package:resturant_management/navigation/routes.dart';
import 'package:resturant_management/theme/app_theme.dart';
import 'package:resturant_management/utils/app_global_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppDI.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: AppGlobalKeys.navigatorKey,
      theme: AppTheme.lightTheme,
      onGenerateRoute: (settings) => onGenerateRoute(settings),
      initialRoute: Routes.splashRoute,
    );
  }
}
