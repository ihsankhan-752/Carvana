import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:carvana/view/navbar/home/widgets/filter_widget.dart';
import 'package:carvana/view/navbar/home/widgets/profile_header_widget.dart';
import 'package:carvana/view/navbar/home/widgets/search_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const ProfileHeaderWidget(),
          SizedBox(
            width: Get.width,
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 20),
              color: AppColors.primaryWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Text(
                      "Select or search your\nfavorite vehicle",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h1Bold.copyWith(fontSize: 22, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SearchInputWidget(),
                          SizedBox(width: 15),
                          FilterWidget(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
