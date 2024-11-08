import 'package:carvana/models/car_model.dart';
import 'package:carvana/res/colors/app_colors.dart';
import 'package:carvana/res/components/buttons/primary_button.dart';
import 'package:carvana/res/routes/routes_name.dart';
import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:carvana/view/navbar/home/home_detail/widgets/all_features_widget_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDetailView extends StatefulWidget {
  final CarModel carModel;
  const HomeDetailView({super.key, required this.carModel});

  @override
  State<HomeDetailView> createState() => _HomeDetailViewState();
}

class _HomeDetailViewState extends State<HomeDetailView> {
  double rotationY = 0.0;
  double rotationX = 0.0;

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      rotationY += details.delta.dx * 0.01;
      rotationX += details.delta.dy * 0.01;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(widget.carModel.name, style: AppTextStyles.h1Bold.copyWith(fontSize: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onPanUpdate: _onPanUpdate,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateY(rotationY)
                    ..rotateX(rotationX),
                  child: Image.asset(
                    widget.carModel.imageUrl,
                    fit: BoxFit.scaleDown,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "All Features",
                    style: AppTextStyles.h1Bold.copyWith(),
                  ),
                  const SizedBox(height: 10),
                  const AllFeaturesWidgetDetailView(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
        height: Get.height * 0.06,
        width: Get.width,
        child: PrimaryButton(
          onPressed: () {
            Get.toNamed(RoutesName.bookingView);
          },
          title: "Book Now For \$1200/Day",
        ),
      ),
    );
  }
}
