import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/view/navbar/favorite/favorite_view.dart';
import 'package:carvana/view/navbar/notification/notification_view.dart';
import 'package:carvana/view/navbar/settings/setting_view.dart';
import 'package:carvana/view/navbar/widgets/custom_tab_widget_navbar_view.dart';
import 'package:carvana/view_model/controllers/auth/auth_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/home/home_view.dart';

class CustomNavbarView extends StatefulWidget {
  const CustomNavbarView({super.key});

  @override
  State<CustomNavbarView> createState() => _CustomNavbarViewState();
}

class _CustomNavbarViewState extends State<CustomNavbarView> {
  int currentIndex = 0;

  final authController = Get.put(AuthViewModel());

  @override
  void initState() {
    authController.fetchUserInformation(FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: Get.height * 0.07,
        color: AppColors.primaryWhite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTabWidgetNavBarView(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                icon: Icons.home_outlined,
                color: currentIndex == 0 ? AppColors.primaryColor : AppColors.primaryBlack,
              ),
              CustomTabWidgetNavBarView(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                icon: Icons.bookmark_border,
                color: currentIndex == 1 ? AppColors.primaryColor : AppColors.primaryBlack,
              ),
              CustomTabWidgetNavBarView(
                onPressed: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                icon: Icons.notifications_active_outlined,
                color: currentIndex == 2 ? AppColors.primaryColor : AppColors.primaryBlack,
              ),
              CustomTabWidgetNavBarView(
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                icon: Icons.settings,
                color: currentIndex == 3 ? AppColors.primaryColor : AppColors.primaryBlack,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: IndexedStack(
            index: currentIndex,
            children: [
              const HomeView(),
              const FavoriteView(),
              const NotificationView(),
              SettingView(),
            ],
          ),
        ),
      ),
    );
  }
}
