import 'package:carvana/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            AppColors.secondaryColor,
            AppColors.primaryColor,
          ],
        ),
      ),
      child: const Center(
        child: Icon(Icons.filter_alt_outlined, color: AppColors.primaryWhite, size: 30),
      ),
    );
  }
}
