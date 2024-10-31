import 'package:flutter/material.dart';

import '../../../../../res/colors/app_colors.dart';
import '../../../../../res/lists/lists.dart';
import '../../../../../res/text_styles/app_text_styles.dart';

class AllFeaturesWidgetDetailView extends StatelessWidget {
  const AllFeaturesWidgetDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 20,
      ),
      itemCount: carFeaturesList.length,
      itemBuilder: (context, index) {
        final carFeatures = carFeaturesList[index];
        return Container(
          decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: Image.asset(
                  carFeatures.icon,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 15),
              Text(carFeatures.title, style: AppTextStyles.h1Bold),
              const SizedBox(height: 5),
              Text(carFeatures.subTitle, style: AppTextStyles.h1.copyWith(fontSize: 14, color: AppColors.primaryGrey))
            ],
          ),
        );
      },
    );
  }
}
