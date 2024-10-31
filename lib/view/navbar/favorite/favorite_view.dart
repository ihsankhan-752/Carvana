import 'package:carvana/view/navbar/home/widgets/all_cars_widget.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          AllCarsWidget(),
        ],
      ),
    );
  }
}
