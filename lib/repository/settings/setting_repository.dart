import 'package:carvana/data/services/settings/firestore_setting_services.dart';

class SettingRepository {
  FireStoreSettingServices settingServices = FireStoreSettingServices();

  Future<void> getTermsAndConditions() async {
    await settingServices.getTermsAndCondition();
  }
}
