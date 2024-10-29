import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/view/navbar/favorite/favorite_view.dart';
import 'package:carvana/view/navbar/home/home_view.dart';
import 'package:carvana/view/navbar/notification/notification_view.dart';
import 'package:carvana/view/navbar/profile/profile_view.dart';
import 'package:carvana/view/navbar/widgets/custom_tab_widget_navbar_view.dart';
import 'package:carvana/view_model/controllers/auth_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavbarView extends StatefulWidget {
  const CustomNavbarView({super.key});

  @override
  State<CustomNavbarView> createState() => _CustomNavbarViewState();
}

class _CustomNavbarViewState extends State<CustomNavbarView> {
  int _currentIndex = 0;

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
                    _currentIndex = 0;
                  });
                },
                icon: Icons.home_outlined,
                color: _currentIndex == 0 ? AppColors.primaryColor : AppColors.primaryBlack,
              ),
              CustomTabWidgetNavBarView(
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                icon: Icons.bookmark_border,
                color: _currentIndex == 1 ? AppColors.primaryColor : AppColors.primaryBlack,
              ),
              CustomTabWidgetNavBarView(
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
                icon: Icons.notifications_active_outlined,
                color: _currentIndex == 2 ? AppColors.primaryColor : AppColors.primaryBlack,
              ),
              CustomTabWidgetNavBarView(
                onPressed: () {
                  setState(() {
                    _currentIndex = 3;
                  });
                },
                icon: Icons.person,
                color: _currentIndex == 3 ? AppColors.primaryColor : AppColors.primaryBlack,
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const HomeView(),
          const FavoriteView(),
          const NotificationView(),
          ProfileView(),
        ],
      ),
    );
  }
}
