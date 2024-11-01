import 'package:carvana/view/navbar/home/booking/widgets/calender_widget.dart';
import 'package:carvana/view/navbar/home/booking/widgets/pick_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../res/components/buttons/primary_button.dart';
import '../../../../res/text_styles/app_text_styles.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
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
            Text("Choose Date", style: AppTextStyles.h1Bold),
            const SizedBox(height: 10),
            const CalenderWidget(),
            const SizedBox(height: 20),
            Text("Pick Time", style: AppTextStyles.h1Bold),
            PickTimeWidget(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
        height: Get.height * 0.06,
        width: Get.width,
        child: PrimaryButton(
          onPressed: () {},
          title: "Book Now For \$1200/Day",
        ),
      ),
    );
  }
}
