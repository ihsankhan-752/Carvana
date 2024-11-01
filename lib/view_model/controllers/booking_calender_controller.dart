import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingController extends GetxController {
  RxSet<DateTime> selectedDates = <DateTime>{}.obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;

  void onDaySelected(DateTime day, DateTime newFocusedDay) {
    focusedDay.value = newFocusedDay;
    if (selectedDates.contains(day)) {
      selectedDates.remove(day);
    } else {
      selectedDates.add(day);
    }
  }
}
