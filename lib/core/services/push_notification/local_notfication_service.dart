import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/routes/routes.dart';

class LocalNotificationService {





  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    // Android init
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS init
    const iosInit = DarwinInitializationSettings();

    // General init
    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );

    await _notificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) {
        // selectNotificationStream.add(details);
         //  if event.payload == -1 do nothing
      if (int.parse(details.payload!) == -1) {
        return;
      }
      //  if event.payload != null && event.payload!.isNotEmpty navigate to the desired screen
      else {
        if (details.payload != null && details.payload!.isNotEmpty) {
          // Navigate to the desired screen using the payload
          getIt<GlobalKey<NavigatorState>>().currentState?.pushNamed(
            Routes.customerProductDetails,
            arguments: int.parse(details.payload!),
          );
        }
      }
        debugPrint('🔔 Notification tapped: ${details.payload}');
      },
    );
  }

  static Future<void> showNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'shopi_channel_id',
      'Shopi Notifications',
      channelDescription: 'Channel for app notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }
}
