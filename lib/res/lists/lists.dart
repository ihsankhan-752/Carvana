import 'package:carvana/models/notification/notification_model.dart';
import 'package:flutter/material.dart';

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
