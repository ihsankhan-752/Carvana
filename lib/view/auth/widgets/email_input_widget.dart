import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_colors.dart';
import '../../../res/text_styles/app_text_styles.dart';

class EmailInputWidget extends StatelessWidget {
  final TextEditingController controller;
  const EmailInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: AppColors.textInputColor,
        filled: true,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: "E-mail",
        hintStyle: AppTextStyles.h2.copyWith(fontSize: 14, color: AppColors.primaryGrey),
        prefixIcon: Icon(Icons.email_outlined, size: Get.height * 0.03, color: AppColors.primaryGrey),
      ),
    );
  }
}
