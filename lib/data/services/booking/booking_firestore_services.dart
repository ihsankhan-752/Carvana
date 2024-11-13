import 'package:carvana/data/app_exceptions.dart';
import 'package:carvana/models/booking/booking_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingFireStoreServices {
  final CollectionReference bookingCollection = FirebaseFirestore.instance.collection('booking');

  Future<void> addBooking(BookingModel bookingModel, String bookingId) async {
    try {
      await bookingCollection.doc(bookingId).set(bookingModel.toMap());
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  Future<void> updatePaymentType(String bookingId, String paymentType) async {
    try {
      await bookingCollection.doc(bookingId).update({
        'paymentType': paymentType,
      });
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
