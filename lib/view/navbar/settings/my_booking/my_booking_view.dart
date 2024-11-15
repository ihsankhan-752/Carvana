import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:carvana/view_model/controllers/booking/booking_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookingView extends StatelessWidget {
  MyBookingView({super.key});

  final bookingController = Get.put(BookingViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("My Booking", style: AppTextStyles.h1Bold),
      ),
      body: StreamBuilder(
        stream: bookingController.getMyBooking.value,
        builder: (ctx, snapshot) {
          if (bookingController.isInitialLoad.value && snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No Booking found"));
          }

          final bookingList = snapshot.data;

          return ListView.builder(
            itemCount: bookingList!.length,
            itemBuilder: (context, index) {
              final booking = bookingList[index];
              bookingController.fetchSingleBookingCar(booking.carId);
              return Obx(() {
                final car = bookingController.selectedCar.value;
                if (car == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Card(
                  child: Column(
                    children: [],
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
