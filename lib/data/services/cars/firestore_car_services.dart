import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/car_model.dart';

class FireStoreCarServices {
  final CollectionReference carCollection = FirebaseFirestore.instance.collection('cars');

  Stream<List<CarModel>> getAllCars() {
    return carCollection.snapshots().map((snap) {
      return snap.docs.map((doc) => CarModel.fromMap(doc)).toList();
    });
  }
}
