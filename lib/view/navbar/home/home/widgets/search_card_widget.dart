import 'package:carvana/view/navbar/home/home/widgets/filter_widget.dart';
import 'package:carvana/view/navbar/home/home/widgets/search_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_colors.dart';
import '../../../../../res/text_styles/app_text_styles.dart';

class SearchCardWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String? v)? onChange;
  const SearchCardWidget({super.key, required this.controller, this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 20),
        color: AppColors.primaryWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                "Select or search your\nfavorite vehicle",
                textAlign: TextAlign.center,
                style: AppTextStyles.h1Bold.copyWith(fontSize: 22, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SearchInputWidget(
                      controller: controller,
                      onChange: onChange,
                    ),
                    SizedBox(width: 15),
                    FilterWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
