import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_colors.dart';
import '../../../../../res/text_styles/app_text_styles.dart';

class SearchInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String? v)? onChange;
  const SearchInputWidget({super.key, required this.controller, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        onChanged: onChange,
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
          prefixIcon: Icon(Icons.search_sharp, size: Get.height * 0.03, color: AppColors.primaryGrey),
        ),
      ),
    );
  }
}
