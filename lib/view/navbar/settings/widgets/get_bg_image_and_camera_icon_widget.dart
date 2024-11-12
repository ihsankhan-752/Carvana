import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../res/assets/app_images.dart';
import '../../../../res/colors/app_colors.dart';
import '../../../../res/components/image_picking_widget.dart';

ImageProvider getBackgroundImage(String dbImage) {
  final imageController = Get.put(ImageController());
  if (imageController.image.value != null) {
    return FileImage(File(imageController.image.value!.path));
  } else if (dbImage.isNotEmpty) {
    return NetworkImage(dbImage);
  } else {
    return const AssetImage(AppImages.appLogo);
  }
}

Widget getCameraIcon() {
  final imageController = Get.put(ImageController());
  return imageController.image.value == null
      ? GestureDetector(
          onTap: () async {
            try {
              await imageController.pickImage(ImageSource.gallery);
            } catch (e) {
              Get.snackbar("Error", "Could not pick image: $e");
            }
          },
          child: const Icon(Icons.camera_alt, size: 50, color: AppColors.primaryBlack),
        )
      : const SizedBox.shrink();
}
