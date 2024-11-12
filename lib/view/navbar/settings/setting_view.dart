import 'package:carvana/models/auth/user_model.dart';
import 'package:carvana/res/assets/app_icons.dart';
import 'package:carvana/res/routes/routes_name.dart';
import 'package:carvana/view/navbar/settings/widgets/profile_list_tile_widget.dart';
import 'package:carvana/view/navbar/settings/widgets/user_document_card_widget.dart';
import 'package:carvana/view/navbar/settings/widgets/user_information_widget.dart';
import 'package:carvana/view_model/controllers/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import 'my_profile/license/license_view.dart';
import 'my_profile/passport/passport_view.dart';

class SettingView extends StatelessWidget {
  SettingView({super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserDocumentCardWidget(
                    onPressed: () {
                      Get.to(() => LicenseView(userModel: user));
                    },
                    documentName: "License",
                    image: AppIcons.licenseIcon,
                  ),
                  UserDocumentCardWidget(
                    onPressed: () {
                      Get.to(() => PassportView(userModel: user));
                    },
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
              ProfileListTileWidget(
                onPressed: () {
                  Get.toNamed(RoutesName.termsAndConditionView);
                },
                title: "Terms & Condition",
                icon: Icons.note_alt_outlined,
              ),
              ProfileListTileWidget(
                onPressed: () {
                  Get.toNamed(RoutesName.contactUsView);
                },
                title: "Contact Us",
                icon: Icons.contact_mail_outlined,
              ),
              ProfileListTileWidget(
                onPressed: () {
                  Get.toNamed(RoutesName.aboutUsView);
                },
                title: "About Us",
                icon: Icons.account_box_outlined,
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
              SizedBox(height: Get.height * 0.015),
            ],
          ),
        ),
      );
    });
  }
}
