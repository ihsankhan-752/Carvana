import 'package:carvana/models/auth/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../res/text_styles/app_text_styles.dart';
import '../my_profile/edit_profile/edit_profile_view.dart';

class UserInformationWidget extends StatelessWidget {
  final UserModel user;
  const UserInformationWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: user.image == ""
          ? Container(
              width: Get.width * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primaryBlack),
              ),
              child: const Center(
                child: Icon(Icons.person, size: 40, color: AppColors.primaryColor),
              ),
            )
          : CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(user.image),
            ),
      title: Text(user.username, style: AppTextStyles.h1Bold.copyWith(fontWeight: FontWeight.w900, fontSize: 20)),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 05),
        child: Text(
          "Since: ${DateFormat('dd-MM-yyyy').format(user.memberSince)}",
          style: AppTextStyles.h1.copyWith(fontSize: 13, color: AppColors.primaryColor),
        ),
      ),
      trailing: GestureDetector(
        onTap: () {
          Get.to(() => EditProfileView(userModel: user));
        },
        child: SizedBox(
          width: 50,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.primaryColor, width: 2),
              ),
              child: const Center(
                child: Icon(Icons.edit, size: 15, color: AppColors.primaryColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
