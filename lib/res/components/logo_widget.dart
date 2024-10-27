import 'package:carvana/res/assets/app_images.dart';
import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LogoWidget extends StatelessWidget {
  final double? height, width, fontSize;
  const LogoWidget({super.key, this.height, this.width, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            height: height ?? Get.height * 0.15,
            width: width ?? Get.width * 0.35,
            child: Image.asset(AppImages.appLogo, fit: BoxFit.cover),
          ),
        ),
        GradientText(
          'Carnava',
          style: AppTextStyles.logoTextStyle.copyWith(fontSize: fontSize ?? 40),
          colors: const [
            AppColors.secondaryColor,
            AppColors.primaryColor,
          ],
        ),
      ],
    );
  }
}
