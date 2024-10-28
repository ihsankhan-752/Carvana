import 'package:carvana/data/app_exceptions.dart';
import 'package:carvana/data/services/firebase_auth_services.dart';
import 'package:carvana/data/services/firestore_services.dart';
import 'package:carvana/models/auth/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuthService _authService = FirebaseAuthService();

  Future<void> signInUser(String email, String password) async {
    User? user = await _authService.signInWithEmail(email, password);

    if (user != null) {
      await FireStoreServices().getUser(user.uid);
    } else {
      throw Exception("Error");
    }
  }

  Future<void> signUpUser({
    required String email,
    required String password,
    required String username,
    required List favouriteCars,
    required String image,
    required String licenseImage,
    required String passportImage,
  }) async {
    User? user = await _authService.signUpWithEmail(email, password);

    if (user != null) {
      UserModel userModel = UserModel(
        userId: user.uid,
        username: username,
        email: email,
        favouriteCars: favouriteCars,
        image: image,
        licenseImage: licenseImage,
        passportImage: passportImage,
        memberSince: DateTime.now(),
      );

      await FireStoreServices().saveUser(userModel);
    } else {
      throw GeneralException('User Sign Up Failed');
    }
  }
}
