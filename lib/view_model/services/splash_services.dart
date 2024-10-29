import 'dart:async';

import 'package:carvana/res/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashServices {
  void isUserLogin() {
    if (FirebaseAuth.instance.currentUser != null) {
      Timer(
        const Duration(seconds: 4),
        () {
          Get.toNamed(RoutesName.navbarView);
        },
      );
    } else {
      Timer(
        const Duration(seconds: 4),
        () {
          Get.toNamed(RoutesName.firstOnboardingView);
        },
      );
    }
  }
}
