// class FirebaseMessagingHandler {
//   static final FirebaseMessaging _firebaseMessaging =
//       FirebaseMessaging.instance;

//   static final ValueNotifier<bool> isNotificationSubscribe = ValueNotifier(
//     false,
//   );

//   static bool isPermissionNotification = false;

//   static Future<void> init() async {
//     await permissionsNotification();

//     /// Foreground
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       final notification = message.notification;
//       if (notification != null) {
//         LocalNotificationService.showNotification(
//           title: notification.title ?? '',
//           body: notification.body ?? '',
//           payload: message.data['productId'] ?? '',
//         );
//       }
//     });

//     /// Background opened
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       _handleNavigation(message);
//     });

//     /// Terminated
//     FirebaseMessaging.instance.getInitialMessage().then((message) {
//       if (message != null) {
//         _handleNavigation(message);
//       }
//     });
//   }

//   /// دالة موحدة للـ Navigation
//   static void _handleNavigation(RemoteMessage message) {
//     final productId = message.data['productId'];
//     if (productId != null) {
//       getIt<GlobalKey<NavigatorState>>().currentState?.pushNamed(
//         '/productDetails',
//         arguments: productId,
//       );
//     }
//   }

//   /// Permissions
//   static Future<void> permissionsNotification() async {
//     final settings = await _firebaseMessaging.requestPermission(badge: true);

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       isPermissionNotification = true;
//       await _subscribeNotification();

//       debugPrint('🔔 User accepted notifications');
//     } else {
//       await _unSubscribeNotification();

//       isPermissionNotification = false;
//       isNotificationSubscribe.value = false;
//       debugPrint('🔕 User denied notifications');
//     }
//   }

//   /// Subscribe
//   static Future<void> _subscribeNotification() async {
//     isNotificationSubscribe.value = true;
//     debugPrint('====🔔 Notification Subscribed 🔔=====');
//   }

//   /// Unsubscribe
//   // ignore: unused_element
//   static Future<void> _unSubscribeNotification() async {
//     isNotificationSubscribe.value = false;
//     await _firebaseMessaging.unsubscribeFromTopic("shopi-users");
//     debugPrint('====🔕 Notification Unsubscribed 🔕=====');
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';
import 'package:shopi/core/routes/routes.dart';
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
    await permissionsNotification();

    /// Foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      if (notification != null) {
        LocalNotificationService.showNotification(
          title: notification.title ?? '',
          body: notification.body ?? '',
          payload: message.data['productId'].toString(),
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

  static void _handleNavigation(RemoteMessage message) {
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final int? productId = int.parse(message.data['productId'].toString())
    // message.data['productId']
    ;
    log(productId.toString());

    if (productId != null && productId != -1) {
      getIt<GlobalKey<NavigatorState>>().currentState?.pushNamed(
        Routes.customerProductDetails,
        arguments: productId,
      );
    } else {
      return;
    }
  }

  /// Permissions
  static Future<void> permissionsNotification() async {
    final settings = await _firebaseMessaging.requestPermission(badge: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      isPermissionNotification = true;
      // لو المستخدم قبل، نشترك افتراضيًا
      await subscribeNotification();
    } else {
      await unSubscribeNotification();
      isPermissionNotification = false;
    }
  }

  /// Subscribe
  // static Future<void> subscribeNotification() async {
  //   isNotificationSubscribe.value = true;
  //   await _firebaseMessaging.subscribeToTopic("shopi-users");
  //   debugPrint('====🔔 Notification Subscribed 🔔=====');
  // }
  // ...

  static Future<void> subscribeNotification() async {
    isNotificationSubscribe.value = true;

    final String role = SharedPref().getString(SharedPrefKeys.userRole) ?? '';
    String topicToSubscribe = 'shopi-users'; // Topic عام كافتراضي

    if (role == 'customer') {
      topicToSubscribe = 'customers'; // Topic للعملاء فقط
    } else if (role == 'admin') {
      topicToSubscribe = 'admins'; // Topic للمشرفين فقط
    }

    await _firebaseMessaging.subscribeToTopic(topicToSubscribe);
    debugPrint('====🔔 Notification Subscribed to $topicToSubscribe 🔔=====');
  }

  // تأكد من أن دالة الإرسال في الـ Cubit ترسل إلى الـ Topic الصحيح
  // (مثلاً: shopi-customers إذا كانت الإشعارات مخصصة للعملاء)

  /// Unsubscribe
  static Future<void> unSubscribeNotification() async {
    isNotificationSubscribe.value = false;
    await _firebaseMessaging.unsubscribeFromTopic("shopi-users");
    debugPrint('====🔕 Notification Unsubscribed 🔕=====');
  }
}
