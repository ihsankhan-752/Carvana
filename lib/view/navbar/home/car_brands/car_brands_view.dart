import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:carvana/view_model/controllers/cars/car_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/car/car_model.dart';
import '../home/widgets/car_card_widget.dart';

class CarBrandsView extends StatelessWidget {
  final String brandName;
  CarBrandsView({super.key, required this.brandName});
  final carController = Get.put(CarViewController());

  @override
  Widget build(BuildContext context) {
    carController.updateBrand(brandName);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        centerTitle: true,
        title: Text(brandName, style: AppTextStyles.h1Bold),
      ),
      body: StreamBuilder<List<CarModel>>(
        stream: carController.carBrandStream.value,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No cars found", style: AppTextStyles.h1Bold));
          }

          final carList = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            itemCount: carList.length,
            itemBuilder: (context, index) {
              final car = carList[index];
              return CarCardWidget(carModel: car);
            },
          );
        },
      ),
    );
  }
}
