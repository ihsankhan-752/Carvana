import 'package:carvana/models/auth/user_model.dart';
import 'package:carvana/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassportAndLicenseImageWidget extends StatelessWidget {
  final UserModel user;
  const PassportAndLicenseImageWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: Get.height * 0.2,
          width: Get.width * 0.44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: user.passportImage.isEmpty
              ? const Text("No Passport added")
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(user.passportImage, fit: BoxFit.cover),
                ),
        ),
        Container(
          height: Get.height * 0.2,
          width: Get.width * 0.44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: user.passportImage.isEmpty
              ? const Text("No License added")
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(user.licenseImage, fit: BoxFit.cover),
                ),
        ),
      ],
    );
  }
}
