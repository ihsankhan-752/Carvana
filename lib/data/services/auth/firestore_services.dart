import 'package:carvana/data/app_exceptions.dart';
import 'package:carvana/models/auth/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreAuthServices {
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> saveUser(UserModel user) async {
    try {
      await userCollection.doc(user.userId).set(user.toMap());
    } catch (e) {
      print("Error saving user: $e");
      rethrow;
    }
  }

  Stream<UserModel?> getUser(String userId) {
    try {
      return userCollection.doc(userId).snapshots().map((snap) {
        if (snap.exists) {
          return UserModel.fromMap(snap);
        } else {
          throw GeneralException("User Not Found");
        }
      });
    } on FirebaseException catch (e) {
      throw FirebaseDatabaseException("Database Error");
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  Future<void> updateUserInformation(Map<String, dynamic> data) async {
    try {
      await userCollection.doc(FirebaseAuth.instance.currentUser!.uid).update(data);
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  Future<void> updatePassportImage(String image) async {
    try {
      await userCollection.doc(FirebaseAuth.instance.currentUser!.uid).update({
        'passportImage': image,
      });
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  Future<void> updateLicenseImage(String image) async {
    try {
      await userCollection.doc(FirebaseAuth.instance.currentUser!.uid).update({
        'licenseImage': image,
      });
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
