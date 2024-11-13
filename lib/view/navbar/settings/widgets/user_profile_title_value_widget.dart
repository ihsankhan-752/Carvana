import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../res/text_styles/app_text_styles.dart';

class UserProfileTitleValueWidget extends StatelessWidget {
  final String title, value;
  const UserProfileTitleValueWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: AppTextStyles.h1.copyWith(
            fontSize: 13,
            color: AppColors.primaryBlack.withOpacity(0.5),
            fontFamily: 'normal',
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 45,
          width: Get.width,
          decoration: BoxDecoration(
            color: AppColors.primaryGrey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 10),
            child: Text(value, style: AppTextStyles.h1Bold.copyWith(color: AppColors.primaryBlack)),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
