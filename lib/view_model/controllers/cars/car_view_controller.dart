import 'package:get/get.dart';

import '../../../models/car_model.dart';
import '../../../repository/cars/car_repository.dart';

class CarViewController extends GetxController {
  final CarRepository carRepository = CarRepository();

  RxString brandName = "".obs;
  Rx<Stream<List<CarModel>>> carBrandStream = Rx<Stream<List<CarModel>>>(const Stream.empty());
  Rx<Stream<List<CarModel>>> carStream = Rx<Stream<List<CarModel>>>(const Stream.empty());
  RxBool isInitialLoad = true.obs;

  @override
  void onInit() {
    super.onInit();
    carStream.value = carRepository.getAllCars();

    ever(brandName, (_) {
      carBrandStream.value = carRepository.getCarByBrand(brandName.value);
    });
  }

  void updateBrand(String newBrandName) {
    brandName.value = newBrandName;
  }
}
