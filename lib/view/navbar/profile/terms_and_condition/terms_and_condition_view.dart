import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:carvana/view_model/controllers/settings/setting_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TermsAndConditionView extends StatelessWidget {
  TermsAndConditionView({super.key});

  final settingController = Get.put(SettingViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        centerTitle: true,
        title: Text("Terms & Conditions", style: AppTextStyles.h1Bold),
      ),
      body: FutureBuilder(
          future: settingController.getTermsAndCondition(),
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
            if (data == null || !data.containsKey('termsAndConditions')) {
              return const Center(
                child: Text("No terms and conditions available."),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Updated On: ${DateFormat('MM/dd/yyyy').format(data['addedDate'].toDate())}",
                    style: AppTextStyles.h1.copyWith(
                      fontFamily: 'normal',
                      color: AppColors.primaryGrey,
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryGrey.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data['termsAndConditions'],
                        style: AppTextStyles.h2.copyWith(
                          fontSize: 14,
                          color: AppColors.primaryBlack.withOpacity(0.8),
                        ),
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
