import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingCalenderController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;

  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;

  Rx<TimeOfDay> selectedPickUpTime = const TimeOfDay(hour: 9, minute: 00).obs;
  Rx<TimeOfDay> selectedReturnTime = const TimeOfDay(hour: 17, minute: 00).obs;

  void getDate(BuildContext context) async {
    DateTime? pickDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime(2040),
    );
    if (pickDate != null) {
      selectedDate.value = pickDate;
    }
  }

  void selectPickUpTime(BuildContext context) async {
    TimeOfDay? pickTime = await showTimePicker(context: context, initialTime: selectedPickUpTime.value);
    if (pickTime != null && pickTime != selectedPickUpTime.value) {
      selectedPickUpTime.value = pickTime;
    }
  }

  void selectReturnTime(BuildContext context) async {
    TimeOfDay? pickTime = await showTimePicker(context: context, initialTime: selectedPickUpTime.value);
    if (pickTime != null && pickTime != selectedReturnTime.value) {
      selectedReturnTime.value = pickTime;
    }
  }
}
