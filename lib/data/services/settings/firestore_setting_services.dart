import 'package:carvana/data/app_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreSettingServices {
  final CollectionReference termsAndConditionCollection = FirebaseFirestore.instance.collection('termsAndConditions');
  final CollectionReference contactUsCollection = FirebaseFirestore.instance.collection('contactUs');

  Future<Map<String, dynamic>> getTermsAndCondition() async {
    try {
      QuerySnapshot snapshot = await termsAndConditionCollection.get();
      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.first.data() as Map<String, dynamic>;
      } else {
        throw GeneralException("No terms and conditions found.");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  Future<Map<String, dynamic>> getContactUs() async {
    QuerySnapshot snap = await contactUsCollection.get();
    try {
      if (snap.docs.isNotEmpty) {
        return snap.docs.first.data() as Map<String, dynamic>;
      } else {
        throw GeneralException("No Contact Us Found");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
