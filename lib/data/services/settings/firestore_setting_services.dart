import 'package:carvana/data/app_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreSettingServices {
  final CollectionReference termsAndConditionCollection = FirebaseFirestore.instance.collection('termsAndCondition');

  Future<void> getTermsAndCondition() async {
    try {
      await termsAndConditionCollection.get();
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
