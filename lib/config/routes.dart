import 'package:cliinic/pages/home/views/home.dart';
import 'package:cliinic/pages/login/views/login_screen.dart';
import 'package:get/get.dart';

import '../pages/home/views/reserva_screen.dart';

class Routes {
  static const String _login = "/";
  static const String _home = '/home';
  static const String _crud = '/home/crud';
  static const String _reservas = '/home/reserva';

  static String getLoginRoute() => _login;
  static String getHomeRoute() => _home;
  static String getCrudRoute() => _crud;
  static String getReservaRoute() => _reservas;

  static List<GetPage> routes = [
    GetPage(
      name: getLoginRoute(),
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: getHomeRoute(),
      page: () => const HomeScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
        name: getReservaRoute(),
        page: () => const ReservaScreen(),
        transition: Transition.rightToLeft)
  ];
}
