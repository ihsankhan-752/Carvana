import 'package:carvana/models/booking/booking_model.dart';
import 'package:carvana/repository/booking/booking_repository.dart';
import 'package:carvana/utils/utils.dart';
import 'package:carvana/view/navbar/home/check_out/check_out_view.dart';
import 'package:carvana/view/navbar/settings/my_booking/my_booking_view.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class BookingViewController extends GetxController {
  BookingRepository bookingRepository = BookingRepository();

  RxBool isLoading = false.obs;

  bool isDateInPast(DateTime selectedDate) {
    DateTime now = DateTime.now();
    return selectedDate.isBefore(now);
  }

  Future<void> addBooking({
    required String userId,
    required String sellerId,
    required String carId,
    DateTime? pickUpDate,
    required String pickUpTime,
    required String returnTime,
    double? totalPrice,
  }) async {
    if (pickUpDate == null || pickUpTime.isEmpty) {
      Utils.toastMessage("Please select a valid pickup date and time.");
      return;
    } else if (returnTime.isEmpty) {
      Utils.toastMessage("Please select a return time.");
      return;
    } else if (isDateInPast(pickUpDate)) {
      Utils.toastMessage("Pick-up date cannot be in the past. Please select a future date.");
      return;
    } else {
      try {
        isLoading.value = true;

        var bookingId = const Uuid().v4();
        BookingModel bookingModel = BookingModel(
            userId: userId,
            sellerId: sellerId,
            carId: carId,
            bookingId: bookingId,
            pickUpDate: pickUpDate,
            totalPrice: totalPrice!,
            pickUpTime: pickUpTime,
            returnTime: returnTime,
            paymentType: "",
            bookingStatus: "Pending");
        await bookingRepository.addBooking(bookingModel, bookingId);

        Get.to(() => CheckOutView(bookingId: bookingId, totalPrice: totalPrice));
      } catch (error) {
        Utils.toastMessage("Failed to add booking. Please try again later.");
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> updatePaymentType(String paymentType, String bookingId) async {
    try {
      isLoading.value = true;
      await bookingRepository.updatePaymentType(bookingId, paymentType);
      isLoading.value = false;
      Utils.toastMessage("Your request has Been Sent");
      Get.to(() => MyBookingView());
      isLoading.value = false;

      // showConfirmDialog();
    } catch (e) {
      isLoading.value = false;
      Utils.toastMessage(e.toString());
    }
  }
}
