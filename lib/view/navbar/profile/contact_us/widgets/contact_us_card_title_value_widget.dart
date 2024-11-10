import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ContactUsCardTitleValueWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const ContactUsCardTitleValueWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: AppColors.primaryColor),
          title: Text(title, style: AppTextStyles.h1Bold.copyWith(fontSize: 15)),
        ),
      ],
    );
  }
}
