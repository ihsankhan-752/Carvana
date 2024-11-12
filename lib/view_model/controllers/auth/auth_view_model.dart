import 'dart:io';

import 'package:carvana/models/auth/user_model.dart';
import 'package:carvana/repository/auth/auth_repository.dart';
import 'package:carvana/res/routes/routes_name.dart';
import 'package:carvana/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/app_exceptions.dart';
import '../../../data/services/storage/storage_services.dart';

class AuthViewModel extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final usernameController = TextEditingController().obs;
  RxBool isPasswordVisible = true.obs;
  RxBool isLoading = false.obs;
  Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  void setPasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void clearTextInputs() {
    emailController.value.clear();
    passwordController.value.clear();
    usernameController.value.clear();
  }

  Future<void> signUpUser({
    required String email,
    required String password,
    required String username,
    List? favouriteCars,
    String? image,
    String? licenseImage,
    String? passportImage,
  }) async {
    if (username.isEmpty) {
      Utils.toastMessage("username required");
    } else if (email.isEmpty) {
      Utils.toastMessage("Email required");
    } else if (password.isEmpty) {
      Utils.toastMessage("Password required");
    } else {
      try {
        isLoading.value = true;
        await _authRepository.signUpUser(
          email: email,
          password: password,
          username: username,
          favouriteCars: [],
          image: "",
          licenseImage: "",
          passportImage: "",
        );

        Get.toNamed(RoutesName.navbarView);
      } catch (e) {
        Utils.toastMessage(e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> signInUser(String email, String password) async {
    if (email.isEmpty) {
      Utils.toastMessage('Email required');
    }

    if (password.isEmpty) {
      Utils.toastMessage("Password required");
    }

    try {
      isLoading.value = true;

      await _authRepository.signInUser(email, password);

      Get.toNamed(RoutesName.navbarView);
    } catch (e) {
      Utils.toastMessage(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      await _authRepository.signOut();
      Get.toNamed(RoutesName.loginView);
    } catch (e) {
      Utils.toastMessage(e.toString());
    }
  }

  void fetchUserInformation(String userId) {
    try {
      _authRepository.getUser(userId).listen((UserModel? user) {
        if (user != null) {
          currentUser.value = user;
        } else {
          Utils.toastMessage("User not found");
        }
      });
    } catch (e) {
      Utils.toastMessage(e.toString());
    }
  }

  Future<void> updateUserInformation({
    String? name,
    File? image,
  }) async {
    try {
      isLoading.value = true;
      String? imageUrl;

      DocumentSnapshot snap =
          await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();

      if (image != null) {
        imageUrl = await StorageServices().uploadFileImage(image);
      } else {
        imageUrl = snap['image'];
      }
      Map<String, dynamic> updatedData = {
        'username': name ?? snap['username'],
        'image': imageUrl,
      };
      await _authRepository.updateUser(updatedData);
      Utils.toastMessage("Changes Saved");
      Get.back();
    } catch (e) {
      throw GeneralException(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updatePassportImage({
    File? image,
  }) async {
    try {
      isLoading.value = true;
      String? imageUrl;

      DocumentSnapshot snap =
          await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();

      if (image != null) {
        imageUrl = await StorageServices().uploadFileImage(image);
      } else {
        imageUrl = snap['passportImage'];
      }
      Map<String, dynamic> updatedData = {
        'passportImage': imageUrl,
      };
      await _authRepository.updateUser(updatedData);
      Utils.toastMessage("Changes Saved");
      Get.back();
    } catch (e) {
      throw GeneralException(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateLicenseImage({
    File? image,
  }) async {
    try {
      isLoading.value = true;
      String? imageUrl;

      DocumentSnapshot snap =
          await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();

      if (image != null) {
        imageUrl = await StorageServices().uploadFileImage(image);
      } else {
        imageUrl = snap['licenseImage'];
      }
      Map<String, dynamic> updatedData = {
        'licenseImage': imageUrl,
      };
      await _authRepository.updateUser(updatedData);
      Utils.toastMessage("Changes Saved");
      Get.back();
    } catch (e) {
      throw GeneralException(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
