import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/car_model.dart';
import '../../../../../res/colors/app_colors.dart';
import '../../../../../res/components/car_shimmer_loading_widget.dart';
import '../../../../../res/text_styles/app_text_styles.dart';
import '../../../../../view_model/controllers/auth/auth_view_model.dart';
import '../../../../../view_model/controllers/cars/car_view_controller.dart';
import '../../home_detail/home_detail_view.dart';

class CarCardWidget extends StatelessWidget {
  final CarModel carModel;
  CarCardWidget({super.key, required this.carModel});

  final userController = Get.put(AuthViewModel());
  final carController = Get.put(CarViewController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          color: AppColors.primaryWhite,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => HomeDetailView(carModel: carModel), transition: Transition.rightToLeftWithFade);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarShimmerLoadingWidget(
                        imageUrl: carModel.imageUrl,
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(carModel.name, style: AppTextStyles.h1Bold.copyWith(fontWeight: FontWeight.w900)),
                          Text(carModel.transmission,
                              style: AppTextStyles.h1.copyWith(color: AppColors.primaryGrey, fontSize: 13)),
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
                            Text("\$ ${carModel.pricePerHour.toStringAsFixed(1)} / Hourly",
                                style: AppTextStyles.h1Bold
                                    .copyWith(fontWeight: FontWeight.w900, fontSize: 14, color: AppColors.primaryColor)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      if (userController.currentUser.value!.favouriteCars.contains(carModel.carId)) {
                        carController.removeCarFromFavourite(carModel.carId);
                      } else {
                        carController.addCarToFavourite(carModel.carId);
                      }
                    },
                    child: Obx(() {
                      return Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryGrey.withOpacity(0.1),
                        ),
                        child: Center(
                          child: Icon(
                            userController.currentUser.value!.favouriteCars.contains(carModel.carId)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: AppColors.primaryGrey.withOpacity(0.7),
                            size: 20,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
