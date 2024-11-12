import 'package:carvana/data/app_exceptions.dart';
import 'package:carvana/data/services/auth/firebase_auth_services.dart';
import 'package:carvana/data/services/auth/firestore_services.dart';
import 'package:carvana/models/auth/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final FireStoreAuthServices _authFireStoreServices = FireStoreAuthServices();

  Future<void> signInUser(String email, String password) async {
    User? user = await _authService.signInWithEmail(email, password);

    if (user != null) {
      FireStoreAuthServices().getUser(user.uid);
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

      await FireStoreAuthServices().saveUser(userModel);
    } else {
      throw GeneralException('User Sign Up Failed');
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }

  Stream<UserModel?> getUser(String userId) {
    return FireStoreAuthServices().getUser(userId);
  }

  Future<void> updateUser(Map<String, dynamic> data) async {
    await _authFireStoreServices.updateUserInformation(data);
  }

  Future<void> updatePassportImage(String image) async {
    await _authFireStoreServices.updatePassportImage(image);
  }

  Future<void> updateLicenseImage(String image) async {
    await _authFireStoreServices.updateLicenseImage(image);
  }
}
