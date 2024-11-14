import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/components/buttons/primary_button.dart';
import '../../../../../res/routes/routes_name.dart';

showConfirmDialog() async {
  return Get.defaultDialog(
      title: "Success",
      content: const Column(
        children: [
          Icon(Icons.celebration),
          Text("Your Booking request is sent \nsuccessfully", textAlign: TextAlign.center),
        ],
      ),
      actions: [
        SizedBox(
          width: Get.width * 0.3,
          height: 40,
          child: PrimaryButton(
            onPressed: () {
              Get.toNamed(RoutesName.navbarView);
            },
            title: "Back",
          ),
        )
      ]);
}
