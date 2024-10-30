import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../res/text_styles/app_text_styles.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: Get.height * 0.06,
        width: Get.width * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primaryWhite,
        ),
        child: const Icon(Icons.location_on_outlined),
      ),
      title: Text("Your Location", style: AppTextStyles.h2.copyWith(fontSize: 12)),
      subtitle: Text("Norvey, USA", style: AppTextStyles.h1Bold),
      trailing: CircleAvatar(
        backgroundColor: AppColors.primaryGrey.withOpacity(0.2),
        radius: 25,
        child: const Center(
          child: Icon(Icons.person, size: 30, color: AppColors.primaryBlack),
        ),
      ),
    );
  }
}
