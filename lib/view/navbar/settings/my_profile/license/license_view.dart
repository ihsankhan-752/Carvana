import 'package:carvana/view_model/controllers/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/auth/user_model.dart';
import '../../../../../res/colors/app_colors.dart';
import '../../../../../res/components/buttons/primary_button.dart';
import '../../../../../res/components/image_picking_widget.dart';
import '../../../../../res/text_styles/app_text_styles.dart';
import '../../widgets/get_bg_image_and_camera_icon_widget.dart';

class LicenseView extends StatefulWidget {
  final UserModel userModel;

  const LicenseView({super.key, required this.userModel});

  @override
  State<LicenseView> createState() => _LicenseViewState();
}

class _LicenseViewState extends State<LicenseView> {
  final imageController = Get.put(ImageController());
  final authController = Get.put(AuthViewModel());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        centerTitle: true,
        title: Text("License", style: AppTextStyles.h1Bold),
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                height: Get.height * 0.25,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryGrey.withOpacity(0.3),
                  image: imageController.image.value != null || widget.userModel.licenseImage.isNotEmpty
                      ? DecorationImage(
                          image: getBackgroundImage(widget.userModel.licenseImage),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: getCameraIcon(),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Obx(() {
          return authController.isLoading.value
              ? SizedBox(
                  height: 60,
                  width: Get.width,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : PrimaryButton(
                  title: "Save",
                  onPressed: () {
                    authController.updateLicenseImage(
                      image: imageController.image.value,
                    );
                  },
                );
        }),
      ),
    );
  }
}
