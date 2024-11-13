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

  Future<void> addCarToFavourite(String carId) async {
    return carServices.addCarToFavorite(carId);
  }

  Future<void> removeCarFromFavourite(String carId) async {
    return carServices.removeCarFromFavourite(carId);
  }

  Stream<List<CarModel>> getFavouriteCars() {
    return carServices.getFavoriteCars();
  }
}
