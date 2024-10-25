import 'package:carvana/res/assets/app_images.dart';
import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            height: Get.height * 0.15,
            width: Get.width * 0.35,
            child: Image.asset(AppImages.appLogo, fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        GradientText(
          'Carnava',
          style: AppTextStyles.logoTextStyle,
          colors: const [
            AppColors.secondaryColor,
            AppColors.primaryColor,
          ],
        ),
      ],
    );
  }
}
