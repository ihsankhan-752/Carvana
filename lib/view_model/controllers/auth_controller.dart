import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final usernameController = TextEditingController().obs;
  RxBool isPasswordVisible = true.obs;

  void setPasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
