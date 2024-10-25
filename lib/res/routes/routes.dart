import 'package:carvana/res/routes/routes_name.dart';
import 'package:carvana/view/auth/login_view.dart';
import 'package:get/get.dart';

import '../../view/splash/splash_view.dart';

class AppRoutes {
  static List<GetPage> appRoutes() {
    return [
      GetPage(
        name: RoutesName.splashView,
        page: () => const SplashView(),
        transition: Transition.leftToRightWithFade,
      ),
      GetPage(
        name: RoutesName.loginView,
        page: () => const LoginView(),
        transition: Transition.leftToRightWithFade,
      ),
    ];
  }
}
