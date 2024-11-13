import 'package:carvana/data/app_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../models/car_model.dart';

class FireStoreCarServices {
  final CollectionReference carCollection = FirebaseFirestore.instance.collection('cars');
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Stream<List<CarModel>> getAllCars() {
    return carCollection.snapshots().map((snap) {
      return snap.docs.map((doc) => CarModel.fromMap(doc)).toList();
    });
  }

  Stream<List<CarModel>> getCarsByBrand(String brandName) {
    return carCollection.where('brand', isEqualTo: brandName).snapshots().map((snap) {
      return snap.docs.map((doc) => CarModel.fromMap(doc)).toList();
    });
  }

  Future<void> addCarToFavorite(String carId) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final userDoc = userCollection.doc(userId);

    try {
      await userDoc.update({
        'favouriteCars': FieldValue.arrayUnion([carId]),
      });
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  Future<void> removeCarFromFavourite(String carId) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final userDoc = userCollection.doc(userId);

    try {
      await userDoc.update({
        'favouriteCars': FieldValue.arrayRemove([carId]),
      });
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  Stream<List<CarModel>> getFavoriteCars() {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    return userCollection.doc(userId).snapshots().asyncMap((docSnap) async {
      if (!docSnap.exists) {
        return [];
      }
      List<dynamic> favoriteCarIds = docSnap['favouriteCars'] ?? [];

      List<CarModel> favoriteCars = [];
      for (String carId in favoriteCarIds) {
        var carDoc = await carCollection.doc(carId).get();
        if (carDoc.exists) {
          favoriteCars.add(CarModel.fromMap(carDoc));
        }
      }
      return favoriteCars;
    });
  }
}
