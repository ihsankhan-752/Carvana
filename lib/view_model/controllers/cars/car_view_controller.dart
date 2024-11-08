import 'package:carvana/models/car_model.dart';
import 'package:carvana/repository/cars/car_repository.dart';
import 'package:get/get.dart';

class CarViewController extends GetxController {
  final CarRepository carRepository = CarRepository();

  RxBool isInitialLoad = true.obs;
  Rx<Stream<List<CarModel>>> carStream = Rx<Stream<List<CarModel>>>(const Stream.empty());

  @override
  void onInit() {
    super.onInit();
    carStream.value = carRepository.getAllCars();
  }
}
