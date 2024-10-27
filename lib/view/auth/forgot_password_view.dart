import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/components/buttons/primary_button.dart';
import 'package:carvana/res/components/logo_widget.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:carvana/view/auth/widgets/email_input_widget.dart';
import 'package:carvana/view_model/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.1),
              LogoWidget(
                height: Get.height * 0.12,
                width: Get.width * 0.25,
                fontSize: 25,
              ),
              SizedBox(height: Get.height * 0.03),
              Text("Forgot Password", style: AppTextStyles.h1Bold.copyWith(fontSize: 20)),
              Text(
                "Please enter you email address.so we'll send you link to get back your account",
                textAlign: TextAlign.center,
                style: AppTextStyles.h2.copyWith(fontSize: 12, color: AppColors.primaryGrey, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Get.height * 0.05),
              EmailInputWidget(controller: authController.emailController.value),
              SizedBox(height: Get.height * 0.04),
              const PrimaryButton(title: "Send Link"),
            ],
          ),
        ),
      ),
    );
  }
}
