import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../res/components/buttons/primary_button.dart';
import '../../../../res/text_styles/app_text_styles.dart';

class CheckOutView extends StatefulWidget {
  final String bookingId;
  final double totalPrice;
  const CheckOutView({super.key, required this.bookingId, required this.totalPrice});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  int groupValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text("Checkout", style: AppTextStyles.h1Bold.copyWith(fontSize: 18)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Container(
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
                        Text("Sub Total:"),
                        Text(widget.totalPrice.toStringAsFixed(1) + " \$"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tax:"),
                        Text("0 \$"),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total:", style: AppTextStyles.h1Bold),
                        Text(widget.totalPrice.toStringAsFixed(1) + " \$", style: AppTextStyles.h1Bold),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: AppColors.primaryWhite,
              child: RadioListTile(
                value: 1,
                groupValue: groupValue,
                onChanged: (v) {
                  setState(() {
                    groupValue = v!;
                  });
                },
                title: const Text("Debit/Credit Card"),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: AppColors.primaryWhite,
              child: RadioListTile(
                value: 2,
                groupValue: groupValue,
                onChanged: (v) {
                  setState(() {
                    groupValue = v!;
                  });
                },
                title: const Text("Cash by Hand"),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
        height: Get.height * 0.06,
        width: Get.width,
        child: PrimaryButton(
          onPressed: () {},
          title: "Pay Now",
        ),
      ),
    );
  }
}
