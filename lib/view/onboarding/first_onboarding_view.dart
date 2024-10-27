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

class FirstOnboardingView extends StatefulWidget {
  const FirstOnboardingView({super.key});

  @override
  State<FirstOnboardingView> createState() => _FirstOnboardingViewState();
}

class _FirstOnboardingViewState extends State<FirstOnboardingView> {
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
              'Locate the destination',
              style: AppTextStyles.logoTextStyle.copyWith(fontSize: 25, fontWeight: FontWeight.w900),
              colors: const [
                AppColors.primaryColor,
                AppColors.secondaryColor,
              ],
            ),
            Text(
              'Your Destination is at your fingertips, Open App & enter where you want to go.',
              style: AppTextStyles.h1.copyWith(color: AppColors.primaryGrey, fontSize: 14),
            ),
            SizedBox(height: Get.height * 0.03),
            OnboardingNextButton(
              title: "Next",
              onPressed: () {
                Get.toNamed(RoutesName.secondOnboardingView);
              },
            ),
            const CustomImageWidget(imageUrl: AppImages.firstOnboardingImage),
          ],
        ),
      ),
    );
  }
}
