import 'package:carvana/models/contact_us_model.dart';
import 'package:flutter/material.dart';
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryGrey.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        contactUsModel.website,
                        style: AppTextStyles.h2.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
