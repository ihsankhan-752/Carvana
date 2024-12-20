import 'package:carvana/view/navbar/settings/widgets/get_bg_image_and_camera_icon_widget.dart';
import 'package:carvana/view_model/controllers/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/auth/user_model.dart';
import '../../../../../res/colors/app_colors.dart';
import '../../../../../res/components/buttons/primary_button.dart';
import '../../../../../res/components/image_picking_widget.dart';
import '../../../../../res/text_styles/app_text_styles.dart';
import '../widgets/edit_username_input_widget.dart';

class EditProfileView extends StatefulWidget {
  final UserModel userModel;

  const EditProfileView({super.key, required this.userModel});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final imageController = Get.put(ImageController());
  final authController = Get.put(AuthViewModel());

  @override
  void initState() {
    super.initState();
    authController.usernameController.value.text = widget.userModel.username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        centerTitle: true,
        title: Text("Edit Profile", style: AppTextStyles.h1Bold),
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.primaryColor.withOpacity(0.3),
                  backgroundImage: getBackgroundImage(widget.userModel.image),
                  child: getCameraIcon(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Username",
                style: AppTextStyles.h1.copyWith(color: AppColors.primaryGrey, fontFamily: 'normal'),
              ),
              EditUsernameInputWidget(
                hintText: widget.userModel.username,
                controller: authController.usernameController.value,
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
                  title: "Update",
                  onPressed: () {
                    authController.updateUserInformation(
                      name: authController.usernameController.value.text,
                      image: imageController.image.value,
                    );
                  },
                );
        }),
      ),
    );
  }
}
