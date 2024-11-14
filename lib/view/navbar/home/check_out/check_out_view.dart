import 'package:carvana/view/navbar/home/check_out/widgets/checkout_header_widget_for_payment_detail.dart';
import 'package:carvana/view/navbar/home/check_out/widgets/payment_method_selection_widget.dart';
import 'package:carvana/view_model/controllers/booking/booking_view_controller.dart';
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
  final bookingController = Get.put(BookingViewController());
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckoutHeaderWidgetForPaymentDetail(totalPrice: widget.totalPrice),
            const SizedBox(height: 30),
            Text("Payment Methods:", style: AppTextStyles.h1Bold),
            const SizedBox(height: 10),
            PaymentMethodSelectionWidget(
              value: 1,
              onChanged: (v) {
                setState(() {
                  groupValue = v!;
                });
              },
              title: "Stripe",
              groupValue: groupValue,
            ),
            const SizedBox(height: 10),
            PaymentMethodSelectionWidget(
              value: 2,
              onChanged: (v) {
                setState(() {
                  groupValue = v!;
                });
              },
              title: "Cash By Hand",
              groupValue: groupValue,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() {
        return bookingController.isLoading.value
            ? Container(
                margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
                height: Get.height * 0.06,
                width: Get.width,
                child: const Center(
                  child: CircularProgressIndicator(),
                ))
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: PrimaryButton(
                  onPressed: () {
                    bookingController.updatePaymentType(
                      "Cash By Hand",
                      widget.bookingId,
                    );
                  },
                  title: "Pay Now",
                ),
              );
      }),
    );
  }
}
