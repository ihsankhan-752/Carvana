import 'package:get/get.dart';

import '../../../data/app_exceptions.dart';
import '../../../repository/settings/setting_repository.dart';

class SettingViewController extends GetxController {
  RxBool isLoading = false.obs;
  final SettingRepository settingRepository = SettingRepository();

  Future<Map<String, dynamic>> getTermsAndCondition() async {
    try {
      isLoading.value = true;
      Map<String, dynamic> data = await settingRepository.getTermsAndConditions();
      return data;
    } catch (e) {
      throw GeneralException(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
