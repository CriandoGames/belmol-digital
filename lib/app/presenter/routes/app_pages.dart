import 'package:desafio_bemol/app/presenter/pages/register/register_bindings.dart';
import 'package:desafio_bemol/app/presenter/pages/register/register_page.dart';
import 'package:get/get.dart';

import '../pages/splash/splash_bindings.dart';
import '../pages/splash/splash_page.dart';
import 'routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const String INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterPage(),
      binding: RegisterBindings(),
    ),
  ];
}
