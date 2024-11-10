import 'package:carvana/data/app_exceptions.dart';
import 'package:carvana/repository/settings/setting_repository.dart';
import 'package:get/get.dart';

class SettingViewController extends GetxController {
  RxBool isLoading = false.obs;
  SettingRepository settingRepository = SettingRepository();

  Future<void> getTermsAndCondition() async {
    try {
      isLoading.value = true;
      await settingRepository.getTermsAndConditions();
    } catch (e) {
      isLoading.value = false;
      throw GeneralException(e.toString());
    }
  }
}
