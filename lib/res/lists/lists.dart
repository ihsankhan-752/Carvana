import 'package:carvana/models/car/car_features_model.dart';
import 'package:carvana/models/car/ui_car_model.dart';
import 'package:carvana/models/notification/notification_model.dart';
import 'package:carvana/res/assets/app_images.dart';
import 'package:carvana/res/assets/car_logos.dart';
import 'package:flutter/material.dart';
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

List<UiCarModel> carLogoList = [
  const UiCarModel(carName: "Audi", carImage: CarLogos.audiLogo),
  const UiCarModel(carName: "BMW", carImage: CarLogos.bmwLogo),
  const UiCarModel(carName: "Ferrari", carImage: CarLogos.ferrariLogo),
  const UiCarModel(carName: "Ford", carImage: CarLogos.fordLogo),
  const UiCarModel(carName: "Honda", carImage: CarLogos.hondaLogo),
  const UiCarModel(carName: "Jaguar", carImage: CarLogos.jaguarLogo),
  const UiCarModel(carName: "Porsche", carImage: CarLogos.porscheLogo),
  const UiCarModel(carName: "Tesla", carImage: CarLogos.teslaLogo),
];

List<UiCarModel> carList = [
  const UiCarModel(carName: "Maserati", carImage: AppImages.audiCar),
  const UiCarModel(carName: "BMW 2 Series", carImage: AppImages.bmwCar),
];

List<CarFeaturesModel> carFeaturesList = const [
  CarFeaturesModel(icon: AppIcons.transmissionIcon, title: "Transmission", subTitle: "Automatic"),
  CarFeaturesModel(icon: AppIcons.seatIcon, title: "Doors & Seats", subTitle: "2 Door & 2 Seats"),
  CarFeaturesModel(icon: AppIcons.acIcon, title: "Air Condition", subTitle: "Climate Control"),
  CarFeaturesModel(icon: AppIcons.fuelIcon, title: "Fuel Type", subTitle: "Petrol"),
];
