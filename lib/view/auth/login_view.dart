import 'package:carvana/res/components/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.05),
          LogoWidget(
            height: Get.height * 0.12,
            width: Get.width * 0.25,
            fontSize: 25,
          ),
        ],
      ),
    );
  }
}
