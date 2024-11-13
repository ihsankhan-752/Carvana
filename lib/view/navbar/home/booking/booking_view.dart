import 'package:carvana/models/car/car_model.dart';
import 'package:carvana/view/navbar/home/booking/widgets/calender_widget.dart';
import 'package:carvana/view/navbar/home/booking/widgets/car_information_widget.dart';
import 'package:carvana/view/navbar/home/booking/widgets/pick_time_widget.dart';
import 'package:carvana/view/navbar/home/booking/widgets/return_time_widget.dart';
import 'package:carvana/view_model/controllers/booking/booking_calender_controller.dart';
import 'package:carvana/view_model/controllers/booking/booking_view_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../res/components/buttons/primary_button.dart';
import '../../../../res/text_styles/app_text_styles.dart';

class BookingView extends StatefulWidget {
  final CarModel carModel;
  const BookingView({super.key, required this.carModel});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  BookingViewController bookingViewController = Get.put(BookingViewController());
  BookingCalenderController bookingTimeAndDateController = Get.put(BookingCalenderController());

  double calculateTotalPrice(TimeOfDay pickUpTime, TimeOfDay returnTime) {
    final now = DateTime.now();
    final pickUpDateTime = DateTime(now.year, now.month, now.day, pickUpTime.hour, pickUpTime.minute);
    final returnDateTime = DateTime(now.year, now.month, now.day, returnTime.hour, returnTime.minute);

    final duration = returnDateTime.difference(pickUpDateTime);

    final totalHours = duration.inHours + duration.inMinutes / 60.0;

    return totalHours * widget.carModel.pricePerHour;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text("Booking", style: AppTextStyles.h1Bold.copyWith(fontSize: 18)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text("Car Information", style: AppTextStyles.h1Bold),
            const SizedBox(height: 10),
            CarInformationWidget(carModel: widget.carModel),
            const SizedBox(height: 20),
            Text("Choose Date", style: AppTextStyles.h1Bold),
            const SizedBox(height: 10),
            const CalenderWidget(),
            const SizedBox(height: 20),
            Text("Pick-Up Time", style: AppTextStyles.h1Bold),
            const SizedBox(height: 10),
            const PickTimeWidget(),
            const SizedBox(height: 20),
            Text("Return Time", style: AppTextStyles.h1Bold),
            const SizedBox(height: 10),
            const ReturnTimeWidget(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() {
        return bookingViewController.isLoading.value
            ? SizedBox(
                height: 60,
                width: Get.width,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: PrimaryButton(
                  onPressed: () {
                    TimeOfDay pickUpTime = bookingTimeAndDateController.selectedPickUpTime.value;
                    TimeOfDay returnTime = bookingTimeAndDateController.selectedReturnTime.value;

                    double totalPrice = calculateTotalPrice(pickUpTime, returnTime);

                    String returnTimeString = returnTime.format(context);
                    String pickUpTimeString = pickUpTime.format(context);

                    bookingViewController.addBooking(
                      userId: FirebaseAuth.instance.currentUser!.uid,
                      sellerId: widget.carModel.userId,
                      carId: widget.carModel.carId,
                      pickUpDate: bookingTimeAndDateController.selectedDate.value,
                      pickUpTime: pickUpTimeString,
                      returnTime: returnTimeString,
                      totalPrice: totalPrice,
                    );
                  },
                  title: "Check Out",
                ),
              );
      }),
    );
  }
}
