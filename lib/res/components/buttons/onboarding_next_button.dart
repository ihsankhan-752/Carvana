import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingNextButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const OnboardingNextButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: Get.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              AppColors.secondaryColor,
              AppColors.primaryColor,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: AppTextStyles.h2.copyWith(
                  fontSize: 14,
                  color: AppColors.primaryWhite,
                ),
              ),
              SizedBox(width: Get.width * 0.02),
              const Icon(Icons.arrow_forward, size: 20, color: AppColors.primaryWhite),
            ],
          ),
        ),
      ),
    );
  }
}
