import 'package:carvana/res/routes/routes_name.dart';
import 'package:carvana/view/auth/congratulation_message_view.dart';
import 'package:carvana/view/auth/forgot_password_view.dart';
import 'package:carvana/view/auth/login_view.dart';
import 'package:carvana/view/auth/signup_view.dart';
import 'package:carvana/view/navbar/home/check_out/check_out_view.dart';
import 'package:carvana/view/onboarding/first_onboarding_view.dart';
import 'package:carvana/view/onboarding/second_onboarding_view.dart';
import 'package:carvana/view/onboarding/third_onboarding_view.dart';
import 'package:get/get.dart';

import '../../view/navbar/custom_navbar_view.dart';
import '../../view/navbar/home/booking/booking_view.dart';
import '../../view/navbar/settings/about_us/about_us_view.dart';
import '../../view/navbar/settings/contact_us/contact_us_view.dart';
import '../../view/navbar/settings/terms_and_condition/terms_and_condition_view.dart';
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
        page: () => LoginView(),
      ),
      GetPage(
        name: RoutesName.signUpView,
        page: () => SignUpView(),
      ),
      GetPage(
        name: RoutesName.forgotPasswordView,
        page: () => ForgotPasswordView(),
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
      GetPage(
        name: RoutesName.congratulationMessageView,
        page: () => const CongratulationMessageView(),
      ),
      GetPage(
        name: RoutesName.navbarView,
        page: () => const CustomNavbarView(),
      ),
      GetPage(
        name: RoutesName.bookingView,
        page: () => const BookingView(),
        transition: Transition.rightToLeftWithFade,
      ),
      GetPage(
        name: RoutesName.checkOutView,
        page: () => const CheckOutView(),
        transition: Transition.rightToLeftWithFade,
      ),
      GetPage(
        name: RoutesName.termsAndConditionView,
        page: () => TermsAndConditionView(),
        transition: Transition.rightToLeftWithFade,
      ),
      GetPage(
        name: RoutesName.contactUsView,
        page: () => ContactUsView(),
        transition: Transition.rightToLeftWithFade,
      ),
      GetPage(
        name: RoutesName.aboutUsView,
        page: () => AboutUsView(),
        transition: Transition.rightToLeftWithFade,
      ),
      // GetPage(
      //   name: RoutesName.homeDetailView,
      //   page: () => HomeDetailView(carModel: CarModel(carName: '', carImage: '')),
      //   transition: Transition.rightToLeftWithFade,
      // ),
    ];
  }
}
