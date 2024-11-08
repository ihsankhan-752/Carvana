import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:carvana/view/navbar/home/home/widgets/car_card_widget.dart';
import 'package:carvana/view/navbar/home/home/widgets/profile_header_widget.dart';
import 'package:carvana/view/navbar/home/home/widgets/search_card_widget.dart';
import 'package:carvana/view/navbar/home/home/widgets/top_brand_widget.dart';
import 'package:carvana/view_model/controllers/cars/car_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final carViewController = Get.put(CarViewController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileHeaderWidget(),
            const SearchCardWidget(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Top Brands", style: AppTextStyles.h1Bold),
                Text(
                  "See All",
                  style: AppTextStyles.h2.copyWith(fontSize: 14, color: AppColors.primaryColor),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const TopBrandWidget(),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("All Cars", style: AppTextStyles.h1Bold),
                Text(
                  "See All",
                  style: AppTextStyles.h2.copyWith(fontSize: 14, color: AppColors.primaryColor),
                ),
              ],
            ),
            const SizedBox(height: 15),
            StreamBuilder(
              stream: carViewController.carStream.value,
              builder: (context, snapshot) {
                if (carViewController.isInitialLoad.value && snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No cars found"));
                }

                final carList = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: carList.length,
                  itemBuilder: (context, index) {
                    final car = carList[index];

                    return CarCardWidget(carModel: car);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
