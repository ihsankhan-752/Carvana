import 'package:carvana/res/assets/app_images.dart';
import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/components/buttons/onboarding_next_button.dart';
import 'package:carvana/res/components/buttons/skip_button.dart';
import 'package:carvana/res/routes/routes_name.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:carvana/view/onboarding/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SecondOnboardingView extends StatefulWidget {
  const SecondOnboardingView({super.key});

  @override
  State<SecondOnboardingView> createState() => _SecondOnboardingViewState();
}

class _SecondOnboardingViewState extends State<SecondOnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryWhite,
        actions: [
          SkipButton(
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GradientText(
              'Select Your Root',
              style: AppTextStyles.logoTextStyle.copyWith(fontSize: 25, fontWeight: FontWeight.w900),
              colors: const [
                AppColors.primaryColor,
                AppColors.secondaryColor,
              ],
            ),
            Text(
              'Get quick access to frequent locations. & save them as a favorites',
              style: AppTextStyles.h1.copyWith(color: AppColors.primaryGrey, fontSize: 14),
            ),
            SizedBox(height: Get.height * 0.03),
            OnboardingNextButton(
                title: "Next",
                onPressed: () {
                  Get.toNamed(RoutesName.thirdOnboardingView);
                }),
            const CustomImageWidget(imageUrl: AppImages.secondOnboardingImage),
          ],
        ),
      ),
    );
  }
}
