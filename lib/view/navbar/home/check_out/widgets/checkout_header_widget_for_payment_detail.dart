import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_colors.dart';
import '../../../../../res/text_styles/app_text_styles.dart';

class CheckoutHeaderWidgetForPaymentDetail extends StatelessWidget {
  final double totalPrice;
  const CheckoutHeaderWidgetForPaymentDetail({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.primaryGrey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Sub Total:"),
                Text("${totalPrice.toStringAsFixed(1)} \$"),
              ],
            ),
            const SizedBox(height: 5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tax:"),
                Text("0 \$"),
              ],
            ),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total:", style: AppTextStyles.h1Bold),
                Text("${totalPrice.toStringAsFixed(1)} \$", style: AppTextStyles.h1Bold),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
