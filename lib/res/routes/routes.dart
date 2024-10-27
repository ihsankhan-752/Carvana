import 'package:carvana/res/routes/routes_name.dart';
import 'package:carvana/view/auth/login_view.dart';
import 'package:carvana/view/onboarding/first_onboarding_view.dart';
import 'package:carvana/view/onboarding/second_onboarding_view.dart';
import 'package:carvana/view/onboarding/third_onboarding_view.dart';
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
      GetPage(
        name: RoutesName.firstOnboardingView,
        page: () => const FirstOnboardingView(),
        transition: Transition.rightToLeftWithFade,
      ),
      GetPage(
        name: RoutesName.secondOnboardingView,
        page: () => const SecondOnboardingView(),
        transition: Transition.rightToLeftWithFade,
      ),
      GetPage(
        name: RoutesName.thirdOnboardingView,
        page: () => const ThirdOnboardingView(),
        transition: Transition.rightToLeftWithFade,
      ),
    ];
  }
}
