import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_colors.dart';
import '../../../../../res/text_styles/app_text_styles.dart';
import '../../../../../view_model/controllers/booking/booking_calender_controller.dart';

class PickTimeWidget extends StatefulWidget {
  const PickTimeWidget({super.key});

  @override
  State<PickTimeWidget> createState() => _PickTimeWidgetState();
}

class _PickTimeWidgetState extends State<PickTimeWidget> {
  final BookingController bookingController = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColors.primaryGrey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () {
              bookingController.selectPickUpTime(context);
            },
            child: Row(
              children: [
                const Icon(Icons.access_time_outlined, size: 22, color: AppColors.primaryBlack),
                const SizedBox(width: 10),
                Text(
                  bookingController.selectedPickUpTime.value.format(context),
                  style: AppTextStyles.h1Bold.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
