import 'dart:async';

import 'package:carvana/res/routes/routes_name.dart';
import 'package:get/get.dart';

class SplashServices {
  void isUserLogin() {
    Timer(const Duration(seconds: 4), () {
      Get.toNamed(RoutesName.firstOnboardingView);
    });
  }
}
