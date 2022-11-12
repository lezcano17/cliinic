import 'package:cliinic/pages/home/views/home.dart';
import 'package:cliinic/pages/login/views/login_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String _login = "/";
  static const String _home = '/home';

  static String getLoginRoute() => _login;
  static String getHomeRoute() => _home;

  static List<GetPage> routes = [
    GetPage(
      name: getLoginRoute(),
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: getHomeRoute(),
      page: () => const HomeScreen(),
      transition: Transition.rightToLeft,
    )
  ];
}
