import 'package:carvana/view_model/controllers/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final authController = Get.put(AuthViewModel());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        authController.signOut();
      },
      child: Center(
        child: Text("Profile View"),
      ),
    );
  }
}
