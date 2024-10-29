import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_colors.dart';

class UserDocumentCardWidget extends StatelessWidget {
  final String? documentName, image;
  final VoidCallback? onPressed;
  const UserDocumentCardWidget({super.key, this.documentName, this.image, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: Get.height * 0.17,
        width: Get.width * 0.4,
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              width: 80,
              child: Image(image: AssetImage(image!), color: AppColors.primaryColor, fit: BoxFit.scaleDown),
            ),
            const SizedBox(height: 15),
            Text(documentName!, style: AppTextStyles.h1Bold)
          ],
        ),
      ),
    );
  }
}
