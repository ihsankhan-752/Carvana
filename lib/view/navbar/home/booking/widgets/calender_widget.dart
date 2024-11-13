import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../res/colors/app_colors.dart';
import '../../../../../res/text_styles/app_text_styles.dart';
import '../../../../../view_model/controllers/booking/booking_calender_controller.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  final bookingController = Get.put(BookingCalenderController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primaryGrey.withOpacity(0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () {
              bookingController.getDate(context);
            },
            child: Row(
              children: [
                const Icon(Icons.calendar_month_sharp, size: 22, color: AppColors.primaryBlack),
                const SizedBox(width: 10),
                Text(DateFormat('MM/dd/yyyy').format(bookingController.selectedDate.value),
                    style: AppTextStyles.h1Bold.copyWith(fontSize: 14)),
              ],
            ),
          ),
        ),
      );
    });
  }
}
