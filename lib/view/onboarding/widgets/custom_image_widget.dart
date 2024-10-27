import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageWidget extends StatelessWidget {
  final String imageUrl;
  const CustomImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: Get.width,
      child: Image.network(
        imageUrl,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
