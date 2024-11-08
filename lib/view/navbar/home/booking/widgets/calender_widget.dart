import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../res/colors/app_colors.dart';
import '../../../../../view_model/controllers/booking/booking_calender_controller.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  final bookingController = Get.put(BookingController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primaryColor),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        return TableCalendar(
          firstDay: DateTime.now(),
          lastDay: DateTime(2101),
          focusedDay: bookingController.focusedDay.value,
          calendarFormat: bookingController.calendarFormat.value,
          selectedDayPredicate: (day) => bookingController.selectedDates.contains(day),
          onDaySelected: bookingController.onDaySelected,
          onFormatChanged: (format) {
            bookingController.calendarFormat.value = format;
          },
          calendarStyle: const CalendarStyle(
            todayDecoration: BoxDecoration(
              color: AppColors.secondaryColor,
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
          ),
        );
      }),
    );
  }
}
