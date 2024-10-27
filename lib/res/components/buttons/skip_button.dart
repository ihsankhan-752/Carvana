import 'package:carvana/res/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const SkipButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text("Skip", style: AppTextStyles.h1),
    );
  }
}
