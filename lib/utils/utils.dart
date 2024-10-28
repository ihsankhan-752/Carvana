import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../res/colors/app_colors.dart';

class Utils {
  static void fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: AppColors.primaryColor,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static showSnackBar(String title, String msg) {
    Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    );
  }
}
