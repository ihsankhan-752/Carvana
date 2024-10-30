import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/lists/lists.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:carvana/view/navbar/home/widgets/profile_header_widget.dart';
import 'package:carvana/view/navbar/home/widgets/search_card_widget.dart';
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
          const SearchCardWidget(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Top Brands", style: AppTextStyles.h1Bold),
              Text("See All", style: AppTextStyles.h2.copyWith(fontSize: 14, color: AppColors.primaryColor)),
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: Get.height * 0.17,
            width: Get.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: carList.length,
              itemBuilder: (context, index) {
                final car = carList[index];
                return SizedBox(
                  width: Get.width * 0.3,
                  child: Card(
                    color: AppColors.primaryWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: Get.height * 0.08,
                            width: Get.width * 0.25,
                            child: Image.asset(
                              car.carImage,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            car.carName,
                            style: AppTextStyles.h1Bold.copyWith(
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
