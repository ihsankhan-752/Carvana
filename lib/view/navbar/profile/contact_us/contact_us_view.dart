import 'package:carvana/models/contact_us_model.dart';
import 'package:carvana/view/navbar/profile/contact_us/widgets/contact_us_card_title_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../res/text_styles/app_text_styles.dart';
import '../../../../view_model/controllers/settings/setting_view_controller.dart';

class ContactUsView extends StatelessWidget {
  ContactUsView({super.key});
  final settingController = Get.put(SettingViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        centerTitle: true,
        title: Text("Contact Us", style: AppTextStyles.h1Bold),
      ),
      body: FutureBuilder(
          future: settingController.getContactUs(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error : ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final data = snapshot.data;

            ContactUsModel contactUsModel = ContactUsModel.fromMap(data!);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Text("We Value Your Feedback!", style: AppTextStyles.h1Bold),
                  const SizedBox(height: 10),
                  Text(
                    "Whether you have a question, suggestion, or simply want to reach out, we’re here to listen. Our team values your feedback as it helps us continually improve.",
                    style: AppTextStyles.h2.copyWith(
                      fontSize: 14,
                      color: AppColors.primaryGrey,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryGrey.withOpacity(0.1),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ContactUsCardTitleValueWidget(icon: Icons.email_outlined, title: contactUsModel.email),
                        const Divider(),
                        ContactUsCardTitleValueWidget(icon: Icons.phone_android, title: contactUsModel.phoneNumber.toString()),
                        const Divider(),
                        ContactUsCardTitleValueWidget(icon: Icons.language, title: contactUsModel.website),
                        const Divider(),
                        ContactUsCardTitleValueWidget(icon: FontAwesomeIcons.whatsapp, title: contactUsModel.whatsApp.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
