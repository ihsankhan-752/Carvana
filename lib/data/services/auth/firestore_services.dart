import 'package:carvana/data/app_exceptions.dart';
import 'package:carvana/models/auth/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> saveUser(UserModel user) async {
    try {
      await userCollection.doc(user.userId).set(user.toMap());
    } catch (e) {
      print("Error saving user: $e");
      rethrow;
    }
  }

  Future<UserModel?> getUser(String userId) async {
    try {
      DocumentSnapshot snap = await userCollection.doc(userId).get();

      if (snap.exists) {
        return UserModel.fromMap(snap);
      } else {
        throw GeneralException("User Not Found");
      }
    } on FirebaseException catch (e) {
      throw FirebaseDatabaseException("Database Error");
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
