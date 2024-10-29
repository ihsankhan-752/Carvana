import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
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
      appBar: AppBar(
        title: Text(getAppBarTitle(currentIndex)),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryWhite,
        centerTitle: true,
        titleTextStyle: AppTextStyles.h1Bold.copyWith(fontSize: 18, color: AppColors.primaryColor),
      ),
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
                icon: Icons.person,
                color: currentIndex == 3 ? AppColors.primaryColor : AppColors.primaryBlack,
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          const HomeView(),
          const FavoriteView(),
          const NotificationView(),
          ProfileView(),
        ],
      ),
    );
  }

  getAppBarTitle(currentIndex) {
    switch (currentIndex) {
      case 0:
        return "Home";
      case 1:
        return "Favorites";
      case 2:
        return "Notifications";
      case 3:
        return "Profile";
      default:
        return "";
    }
  }
}
