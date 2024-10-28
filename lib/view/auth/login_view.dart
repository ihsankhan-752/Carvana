import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/components/buttons/primary_button.dart';
import 'package:carvana/res/components/logo_widget.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:carvana/view/auth/widgets/auth_footer_widget.dart';
import 'package:carvana/view/auth/widgets/email_input_widget.dart';
import 'package:carvana/view/auth/widgets/forgot_password_widget.dart';
import 'package:carvana/view/auth/widgets/password_input_widget.dart';
import 'package:carvana/view_model/controllers/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/routes/routes_name.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final authController = Get.put(AuthViewModel());

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
              Text("Welcome Back", style: AppTextStyles.h1Bold.copyWith(fontSize: 20)),
              Text(
                "Log in to your account using\nEmail",
                textAlign: TextAlign.center,
                style: AppTextStyles.h2.copyWith(fontSize: 12, color: AppColors.primaryGrey, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Get.height * 0.05),
              EmailInputWidget(controller: authController.emailController.value),
              SizedBox(height: Get.height * 0.02),
              PasswordInputWidget(controller: authController.passwordController.value),
              SizedBox(height: Get.height * 0.02),
              const ForgotPasswordWidget(),
              SizedBox(height: Get.height * 0.04),
              Obx(() {
                return authController.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : PrimaryButton(
                        onPressed: () {
                          authController
                              .signInUser(
                            authController.emailController.value.text,
                            authController.passwordController.value.text,
                          )
                              .then((e) {
                            authController.clearTextInputs();
                          });
                        },
                        title: "Log In",
                      );
              }),
              SizedBox(height: Get.height * 0.045),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RoutesName.signUpView);
                },
                child: const AuthFooterWidget(
                  title: "First time here?",
                  value: "Sign Up",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
