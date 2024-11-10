import 'package:carvana/data/services/settings/firestore_setting_services.dart';

class SettingRepository {
  FireStoreSettingServices settingServices = FireStoreSettingServices();

  Future<Map<String, dynamic>> getTermsAndConditions() async {
    return await settingServices.getTermsAndCondition();
  }

  Future<Map<String, dynamic>> getContactUs() async {
    return await settingServices.getContactUs();
  }

  Future<Map<String, dynamic>> getAboutUs() async {
    return await settingServices.getAboutUs();
  }
}
