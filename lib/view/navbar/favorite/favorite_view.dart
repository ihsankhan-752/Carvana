import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/controllers/cars/car_view_controller.dart';
import '../home/home/widgets/car_card_widget.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  final carViewController = Get.put(CarViewController());
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: CupertinoSearchTextField(
                controller: searchController,
                onChanged: (v) {
                  setState(() {});
                },
              ),
            ),
            StreamBuilder(
              stream: carViewController.favoriteCarsStream.value,
              builder: (context, snapshot) {
                if (carViewController.isInitialLoad.value && snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.35),
                    child: const CircularProgressIndicator(),
                  ));
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.35),
                    child: Text(
                      "No cars found in \nfavourite",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h1Bold.copyWith(fontSize: 18),
                    ),
                  ));
                }

                final carList = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: carList.length,
                  itemBuilder: (context, index) {
                    final car = carList[index];

                    if (searchController.text.isEmpty ||
                        car.name.toString().toLowerCase().contains(searchController.text.toLowerCase())) {
                      return CarCardWidget(carModel: car);
                    } else {
                      return const SizedBox();
                    }
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
