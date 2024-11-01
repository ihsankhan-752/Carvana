import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingController extends GetxController {
  RxSet<DateTime> selectedDates = <DateTime>{}.obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;

  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;

  void onDaySelected(DateTime day, DateTime newFocusedDay) {
    focusedDay.value = newFocusedDay;
    if (selectedDates.contains(day)) {
      selectedDates.remove(day);
    } else {
      selectedDates.add(day);
    }
  }

  void selectPickUpTime(BuildContext context) async {
    TimeOfDay? pickTime = await showTimePicker(context: context, initialTime: selectedTime.value);
    if (pickTime != null && pickTime != selectedTime.value) {
      selectedTime.value = pickTime;
    }
  }
}
