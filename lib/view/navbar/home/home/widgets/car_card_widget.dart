import 'package:carvana/models/car_model.dart';
import 'package:carvana/res/components/car_shimmer_loading_widget.dart';
import 'package:carvana/view/navbar/home/home_detail/home_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_colors.dart';
import '../../../../../res/text_styles/app_text_styles.dart';

class CarCardWidget extends StatelessWidget {
  final CarModel carModel;
  const CarCardWidget({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: () {
          Get.to(() => HomeDetailView(carModel: carModel), transition: Transition.rightToLeftWithFade);
        },
        child: Card(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          color: AppColors.primaryWhite,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryGrey.withOpacity(0.1),
                    ),
                    child: Center(
                      child: Icon(Icons.favorite_border, color: AppColors.primaryGrey.withOpacity(0.7), size: 20),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarShimmerLoadingWidget(
                      imageUrl: carModel.imageUrl,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(carModel.name, style: AppTextStyles.h1Bold.copyWith(fontWeight: FontWeight.w900)),
                        Text("Automatic", style: AppTextStyles.h1.copyWith(color: AppColors.primaryGrey, fontSize: 13)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          const Icon(Icons.grade_outlined, size: 25, color: AppColors.golderColor),
                          const SizedBox(width: 5),
                          Text("4.8", style: AppTextStyles.h1Bold.copyWith(fontWeight: FontWeight.w700)),
                          const SizedBox(width: 3),
                          Text("(150)", style: AppTextStyles.h1.copyWith(color: AppColors.primaryGrey, fontSize: 14)),
                          const Spacer(),
                          Text("\$ 540/day",
                              style: AppTextStyles.h1Bold
                                  .copyWith(fontWeight: FontWeight.w900, fontSize: 14, color: AppColors.primaryColor)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
