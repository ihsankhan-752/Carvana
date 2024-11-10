import 'package:carvana/data/services/cars/firestore_car_services.dart';
import 'package:carvana/models/car_model.dart';

class CarRepository {
  final FireStoreCarServices carServices = FireStoreCarServices();

  Stream<List<CarModel>> getAllCars() {
    return carServices.getAllCars();
  }

  Stream<List<CarModel>> getCarByBrand(String brandName) {
    return carServices.getCarsByBrand(brandName);
  }
}
