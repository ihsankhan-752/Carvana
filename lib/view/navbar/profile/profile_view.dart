import 'package:carvana/models/auth/user_model.dart';
import 'package:carvana/res/assets/app_icons.dart';
import 'package:carvana/view/navbar/profile/widgets/profile_list_tile_widget.dart';
import 'package:carvana/view/navbar/profile/widgets/user_document_card_widget.dart';
import 'package:carvana/view/navbar/profile/widgets/user_information_widget.dart';
import 'package:carvana/view_model/controllers/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final AuthViewModel _authViewModel = Get.find<AuthViewModel>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      UserModel? user = _authViewModel.currentUser.value;
      if (user == null) {
        return const Center(child: CircularProgressIndicator());
      }

      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.03),
              UserInformationWidget(user: user),
              const Divider(),
              SizedBox(height: Get.height * 0.02),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserDocumentCardWidget(
                    documentName: "Licence",
                    image: AppIcons.licenseIcon,
                  ),
                  UserDocumentCardWidget(
                    documentName: "Passport",
                    image: AppIcons.passportIcon,
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.025),
              const ProfileListTileWidget(
                title: "My Profile",
                icon: Icons.person,
              ),
              const ProfileListTileWidget(
                title: "My Booking",
                icon: Icons.calendar_month_sharp,
              ),
              const ProfileListTileWidget(
                title: "Terms & Condition",
                icon: Icons.note_alt_outlined,
              ),
              const ProfileListTileWidget(
                title: "Language",
                icon: Icons.language,
              ),
              const Spacer(),
              ProfileListTileWidget(
                onPressed: () {
                  Utils.alertDialog("Are you sure to Logout?", () {
                    _authViewModel.signOut();
                  });
                },
                title: "Logout",
                icon: Icons.logout,
                isIconRequired: false,
              ),
              SizedBox(height: Get.height * 0.025),
            ],
          ),
        ),
      );
    });
  }
}
