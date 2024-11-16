import 'package:carvana/models/car/car_model.dart';
import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:carvana/view/navbar/settings/my_booking/widgets/booking_info_widget.dart';
import 'package:carvana/view/navbar/settings/my_booking/widgets/car_info_widget.dart';
import 'package:carvana/view_model/controllers/booking/booking_view_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/booking/booking_model.dart';

class MyBookingView extends StatelessWidget {
  MyBookingView({super.key});
  final bookingController = Get.put(BookingViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        centerTitle: true,
        title: Text("My Booking", style: AppTextStyles.h1Bold),
      ),
      body: StreamBuilder<List<BookingModel>>(
        stream: bookingController.getMyBooking.value,
        builder: (ctx, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No bookings found", style: AppTextStyles.h1Bold));
          }

          final bookingList = snapshot.data!;

          return ListView.builder(
            itemCount: bookingList.length,
            itemBuilder: (context, index) {
              final booking = bookingList[index];

              return StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('cars').doc(booking.carId).snapshots(),
                  builder: (context, carSnap) {
                    if (!carSnap.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final car = CarModel.fromMap(carSnap.data!);
                    return Card(
                      color: AppColors.primaryWhite,
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Car Information",
                                style: AppTextStyles.h1
                                    .copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
                              ),
                            ),
                            const SizedBox(height: 20),
                            CarInfoWidget(car: car),
                            const Divider(),
                            const SizedBox(height: 10),
                            Center(
                              child: Text(
                                "Booking Information",
                                style: AppTextStyles.h1
                                    .copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
                              ),
                            ),
                            const SizedBox(height: 10),
                            BookingInfoWidget(booking: booking),
                          ],
                        ),
                      ),
                    );
                  });
            },
          );
        },
      ),
    );
  }
}
