import 'package:carvana/res/assets/app_images.dart';
import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/components/buttons/primary_button.dart';
import 'package:carvana/res/routes/routes_name.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CongratulationMessageView extends StatelessWidget {
  const CongratulationMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.1),
            SizedBox(
              height: Get.height * 0.4,
              width: Get.width,
              child: Image.network(AppImages.confirmMsg),
            ),
            SizedBox(height: Get.height * 0.03),
            Text("Link has been sent", style: AppTextStyles.h1Bold.copyWith(fontSize: 25)),
            SizedBox(height: Get.height * 0.03),
            Text(
              "Please check your email address and reset your password & login again with \nnew password",
              textAlign: TextAlign.center,
              style: AppTextStyles.h2.copyWith(
                fontSize: 14,
                color: AppColors.primaryGrey,
              ),
            ),
            SizedBox(height: Get.height * 0.05),
             PrimaryButton(
               onPressed: (){
                 Get.toNamed(RoutesName.loginView);
               },
              title: "Back to Log In",
            )
          ],
        ),
      ),
    );
  }
}
