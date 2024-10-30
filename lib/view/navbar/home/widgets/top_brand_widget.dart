import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../res/lists/lists.dart';
import '../../../../res/text_styles/app_text_styles.dart';

class TopBrandWidget extends StatelessWidget {
  const TopBrandWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.17,
      width: Get.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: carLogoList.length,
        itemBuilder: (context, index) {
          final car = carLogoList[index];
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
    );
  }
}
