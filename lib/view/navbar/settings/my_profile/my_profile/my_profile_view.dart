import 'package:carvana/models/auth/user_model.dart';
import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/passport_and_license_image_widget.dart';
import '../../widgets/user_profile_title_value_widget.dart';

class MyProfileView extends StatelessWidget {
  final UserModel user;

  const MyProfileView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        centerTitle: true,
        title: Text("My Profile", style: AppTextStyles.h1Bold),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage(user.image),
              ),
            ),
            const SizedBox(height: 20),
            Text("General Information", style: AppTextStyles.h1Bold),
            SizedBox(
              width: Get.width,
              child: Card(
                color: AppColors.primaryWhite,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserProfileTitleValueWidget(title: 'username', value: user.username),
                      UserProfileTitleValueWidget(title: 'email', value: user.email),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text("Passport & License", style: AppTextStyles.h1Bold),
            const SizedBox(height: 10),
            PassportAndLicenseImageWidget(user: user),
          ],
        ),
      ),
    );
  }
}
