import 'package:carvana/data/services/booking/booking_firestore_services.dart';
import 'package:carvana/models/booking/booking_model.dart';
import 'package:carvana/models/car/car_model.dart';

class BookingRepository {
  BookingFireStoreServices bookingFireStoreServices = BookingFireStoreServices();

  Future<void> addBooking(BookingModel bookingModel, String bookingId) async {
    await bookingFireStoreServices.addBooking(bookingModel, bookingId);
  }

  Future<void> updatePaymentType(String bookingId, String paymentType) async {
    await bookingFireStoreServices.updatePaymentType(bookingId, paymentType);
  }

  Stream<List<BookingModel>> getMyBooking() {
    return bookingFireStoreServices.getMyBooking();
  }

  Future<CarModel> getSingleCar(String id) async {
    CarModel carModel = await bookingFireStoreServices.getSingleBookingCar(id);
    return carModel;
  }
}
