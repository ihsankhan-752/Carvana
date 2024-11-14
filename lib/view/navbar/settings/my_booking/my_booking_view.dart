import 'package:carvana/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookingView extends StatelessWidget {
  const MyBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("My Booking"),
      ),
      body: Center(
        child: GestureDetector(
            onTap: () {
              Get.toNamed(RoutesName.navbarView);
            },
            child: Text("Go Back")),
      ),
    );
  }
}
