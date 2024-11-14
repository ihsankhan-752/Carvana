import 'package:carvana/data/app_exceptions.dart';
import 'package:get/get.dart';

import '../../../models/car/car_model.dart';
import '../../../repository/cars/car_repository.dart';

class CarViewController extends GetxController {
  final CarRepository carRepository = CarRepository();

  RxString brandName = "".obs;
  Rx<Stream<List<CarModel>>> carBrandStream = Rx<Stream<List<CarModel>>>(const Stream.empty());
  Rx<Stream<List<CarModel>>> carStream = Rx<Stream<List<CarModel>>>(const Stream.empty());
  Rx<Stream<List<CarModel>>> favoriteCarsStream = Rx<Stream<List<CarModel>>>(const Stream.empty());
  RxBool isInitialLoad = true.obs;

  @override
  void onInit() {
    super.onInit();
    carStream.value = carRepository.getAllCars();
    carStream.value.listen((carList) {
      if (carList.isNotEmpty) {
        isInitialLoad.value = false;
      }
    });

    ever(brandName, (_) {
      carBrandStream.value = carRepository.getCarByBrand(brandName.value);
    });

    loadFavouriteCars();
  }

  void getAllCar() {
    carStream.value = carRepository.getAllCars();
  }

  void updateBrand(String newBrandName) {
    brandName.value = newBrandName;
  }

  Future<void> addCarToFavourite(String carId) async {
    try {
      await carRepository.addCarToFavourite(carId);
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  Future<void> removeCarFromFavourite(String carId) async {
    try {
      await carRepository.removeCarFromFavourite(carId);
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  void loadFavouriteCars() {
    favoriteCarsStream.value = carRepository.getFavouriteCars();
  }
}
