// import 'dart:developer';

// import 'package:shopi/core/services/graphql/api_check_result.dart';
// import 'package:shopi/core/services/push_notification/firebase_cloud_messaging.dart';

// class NotifactionRepos {
//   Future<ApiCheckResult<void>> sendNotification({
//     required String title,
//     required String body,
//     required int productId,
//   }) async {
//     try {
//       final response = await FirebaseCloudMessaging().sendTopicNotification(
//         body: body,
//         title: title,
//         data: {'productId': productId},
//       );
//       return ApiCheckResult.success(response);
//     } catch (error) {
//       log("error in notification repos");
//       return ApiCheckResult.failure(error.toString());
//     }
//   }
// }

import 'dart:developer';
import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/core/services/push_notification/firebase_cloud_messaging.dart';

class NotifactionRepos {
  Future<ApiCheckResult<dynamic>> sendNotification({
    required String title,
    required String body,
    required int productId,
  }) async {
    try {
      final response = await FirebaseCloudMessaging().sendTopicNotification(
        body: body,
        title: title,
        data: {'productId': productId.toString()},
        topic: "customers",
      );

      // هنا نرجع body أو كامل الـ response.data عشان الـ cubit يقدر يستخدمه
      return ApiCheckResult.success(response.data);
    } catch (error) {
      log("error in notification repos => $error");
      return ApiCheckResult.failure(error.toString());
    }
  }
}
