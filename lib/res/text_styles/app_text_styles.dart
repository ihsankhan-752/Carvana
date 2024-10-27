import 'package:carvana/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle logoTextStyle = GoogleFonts.josefinSans(
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
  );
  static TextStyle h1 = GoogleFonts.josefinSans(
    fontSize: 16.0,
    color: AppColors.primaryBlack,
  );
  static TextStyle h2 = const TextStyle(
    fontSize: 16.0,
    color: AppColors.primaryBlack,
  );
}
