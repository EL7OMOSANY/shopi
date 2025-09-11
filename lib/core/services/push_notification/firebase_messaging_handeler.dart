import 'package:flutter/material.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/services/push_notification/local_notfication_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingHandler {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static final ValueNotifier<bool> isNotificationSubscribe = ValueNotifier(
    false,
  );

  static bool isPermissionNotification = false;

  static Future<void> init() async {
    await _permissionsNotification();

    /// Foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      if (notification != null) {
        LocalNotificationService.showNotification(
          title: notification.title ?? '',
          body: notification.body ?? '',
          payload: message.data['productId'] ?? '',
        );
      }
    });

    /// Background opened
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleNavigation(message);
    });

    /// Terminated
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        _handleNavigation(message);
      }
    });
  }

  /// دالة موحدة للـ Navigation
  static void _handleNavigation(RemoteMessage message) {
    final productId = message.data['productId'];
    if (productId != null) {
      getIt<GlobalKey<NavigatorState>>().currentState?.pushNamed(
        '/productDetails',
        arguments: productId,
      );
    }
  }

  /// Permissions
  static Future<void> _permissionsNotification() async {
    final settings = await _firebaseMessaging.requestPermission(badge: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      isPermissionNotification = true;
      await _subscribeNotification();
      debugPrint('🔔 User accepted notifications');
    } else {
      isPermissionNotification = false;
      isNotificationSubscribe.value = false;
      debugPrint('🔕 User denied notifications');
    }
  }

  /// Subscribe
  static Future<void> _subscribeNotification() async {
    isNotificationSubscribe.value = true;
    debugPrint('====🔔 Notification Subscribed 🔔=====');
  }

  /// Unsubscribe
  // ignore: unused_element
  static Future<void> _unSubscribeNotification() async {
    isNotificationSubscribe.value = false;
    await _firebaseMessaging.unsubscribeFromTopic("shopi-users");
    debugPrint('====🔕 Notification Unsubscribed 🔕=====');
  }
}
