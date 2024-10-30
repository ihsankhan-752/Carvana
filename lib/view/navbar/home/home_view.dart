import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:carvana/view/navbar/home/widgets/all_cars_widget.dart';
import 'package:carvana/view/navbar/home/widgets/profile_header_widget.dart';
import 'package:carvana/view/navbar/home/widgets/search_card_widget.dart';
import 'package:carvana/view/navbar/home/widgets/top_brand_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileHeaderWidget(),
            const SearchCardWidget(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Top Brands", style: AppTextStyles.h1Bold),
                Text(
                  "See All",
                  style: AppTextStyles.h2.copyWith(fontSize: 14, color: AppColors.primaryColor),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const TopBrandWidget(),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("All Cars", style: AppTextStyles.h1Bold),
                Text(
                  "See All",
                  style: AppTextStyles.h2.copyWith(fontSize: 14, color: AppColors.primaryColor),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const AllCarsWidget(),
          ],
        ),
      ),
    );
  }
}
