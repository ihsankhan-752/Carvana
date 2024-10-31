import 'package:carvana/models/car/car_features_model.dart';
import 'package:carvana/models/notification/notification_model.dart';
import 'package:carvana/res/assets/app_images.dart';
import 'package:carvana/res/assets/car_logos.dart';
import 'package:flutter/material.dart';

import '../../models/car/car_model.dart';
import '../assets/app_icons.dart';

List<NotificationModel> notificationList = const [
  NotificationModel(
    notificationTitle: 'Approved',
    notificationDescription: 'Your booking is approved',
    icon: Icons.check_circle_outline,
  ),
  NotificationModel(
    notificationTitle: 'Reject',
    notificationDescription: 'Your booking is rejected',
    icon: Icons.cancel_outlined,
  ),
  NotificationModel(
    notificationTitle: 'Approved',
    notificationDescription: 'Your booking is approved',
    icon: Icons.check_circle_outline,
  ),
  NotificationModel(
    notificationTitle: 'rejected',
    notificationDescription: 'Your booking is rejected',
    icon: Icons.cancel_outlined,
  ),
];

List<CarModel> carLogoList = [
  CarModel(carName: "Audi", carImage: CarLogos.audiLogo),
  CarModel(carName: "BMW", carImage: CarLogos.bmwLogo),
  // CarModel(carName: "Dodge", carImage: CarLogos.dodgeLogo),
  CarModel(carName: "Ferrari", carImage: CarLogos.ferrariLogo),
  CarModel(carName: "Ford", carImage: CarLogos.fordLogo),
  CarModel(carName: "Honda", carImage: CarLogos.hondaLogo),
  CarModel(carName: "Jaguar", carImage: CarLogos.jaguarLogo),
  CarModel(carName: "Porsche", carImage: CarLogos.porscheLogo),
  CarModel(carName: "Tesla", carImage: CarLogos.teslaLogo),
];

List<CarModel> carList = [
  CarModel(carName: "Maserati", carImage: AppImages.audiCar),
  CarModel(carName: "BMW 2 Series", carImage: AppImages.bmwCar),
];

List<CarFeaturesModel> carFeaturesList = const [
  CarFeaturesModel(icon: AppIcons.transmissionIcon, title: "Transmission", subTitle: "Automatic"),
  CarFeaturesModel(icon: AppIcons.seatIcon, title: "Doors & Seats", subTitle: "2 Door & 2 Seats"),
  CarFeaturesModel(icon: AppIcons.acIcon, title: "Air Condition", subTitle: "Climate Control"),
  CarFeaturesModel(icon: AppIcons.fuelIcon, title: "Fuel Type", subTitle: "Petrol"),
];
