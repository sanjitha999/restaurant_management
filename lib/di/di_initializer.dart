import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:resturant_management/modules/login/webservice/login_repository.dart';

class AppDI {
  const AppDI();

  factory AppDI.initialize() {
    _addDependency<LoginRepository>(
      object: LoginRepoImpl(),
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
