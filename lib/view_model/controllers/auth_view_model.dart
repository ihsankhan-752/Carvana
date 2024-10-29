import 'package:carvana/repository/auth_repository.dart';
import 'package:carvana/res/routes/routes_name.dart';
import 'package:carvana/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final usernameController = TextEditingController().obs;
  RxBool isPasswordVisible = true.obs;
  RxBool isLoading = false.obs;

  void setPasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void clearTextInputs() {
    emailController.value.clear();
    passwordController.value.clear();
    usernameController.value.clear();
  }

  Future<void> signUpUser({
    required String email,
    required String password,
    required String username,
    List? favouriteCars,
    String? image,
    String? licenseImage,
    String? passportImage,
  }) async {
    if (username.isEmpty) {
      Utils.toastMessage("username required");
    } else if (email.isEmpty) {
      Utils.toastMessage("Email required");
    } else if (password.isEmpty) {
      Utils.toastMessage("Password required");
    } else {
      try {
        isLoading.value = true;
        await _authRepository.signUpUser(
          email: email,
          password: password,
          username: username,
          favouriteCars: [],
          image: "",
          licenseImage: "",
          passportImage: "",
        );

        Get.toNamed(RoutesName.navbarView);
      } catch (e) {
        Utils.toastMessage(e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> signInUser(String email, String password) async {
    if (email.isEmpty) {
      Utils.toastMessage('Email required');
    }

    if (password.isEmpty) {
      Utils.toastMessage("Password required");
    }

    try {
      isLoading.value = true;

      await _authRepository.signInUser(email, password);

      Get.toNamed(RoutesName.navbarView);
    } catch (e) {
      Utils.toastMessage(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      await _authRepository.signOut();
      Get.toNamed(RoutesName.loginView);
    } catch (e) {
      Utils.toastMessage(e.toString());
    }
  }
}
