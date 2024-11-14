import 'package:flutter/material.dart';

import '../../../../../res/colors/app_colors.dart';

class PaymentMethodSelectionWidget extends StatelessWidget {
  final Function(int? v)? onChanged;
  final String title;
  final int groupValue, value;
  const PaymentMethodSelectionWidget(
      {super.key, this.onChanged, required this.title, required this.groupValue, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryWhite,
      child: RadioListTile(
        hoverColor: Colors.transparent,
        activeColor: AppColors.primaryColor,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Text(title),
      ),
    );
  }
}
