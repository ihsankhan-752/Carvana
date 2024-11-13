import 'package:carvana/models/car/car_model.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_colors.dart';

class CarInformationWidget extends StatelessWidget {
  final CarModel carModel;

  const CarInformationWidget({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.2,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Get.width * 0.35,
              height: Get.height * 0.15,
              child: Image.network(carModel.imageUrl, fit: BoxFit.cover),
            ),
            const SizedBox(width: 10),
            Container(height: Get.height * 0.16, width: 1, color: AppColors.primaryBlack),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Brand: ${carModel.brand}", style: AppTextStyles.h2.copyWith(fontSize: 14)),
                const SizedBox(height: 4),
                Text("Name: ${carModel.name}", style: AppTextStyles.h2.copyWith(fontSize: 14)),
                const SizedBox(height: 4),
                Text("Transmission: ${carModel.transmission}", style: AppTextStyles.h2.copyWith(fontSize: 14)),
                const SizedBox(height: 4),
                Text("A/C: ${carModel.airConditioning}", style: AppTextStyles.h2.copyWith(fontSize: 14)),
                const SizedBox(height: 4),
                Text("Fuel Type: ${carModel.fuelType}", style: AppTextStyles.h2.copyWith(fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
