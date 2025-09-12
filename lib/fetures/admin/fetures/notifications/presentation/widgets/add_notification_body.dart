import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/widgets/create/create_notification.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/widgets/custom_notification_list.dart';

class AddNotificationBody extends StatelessWidget {
  const AddNotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Column(
        children: [
          // create notification title
          const CreateNotification(),
          //get all notifications
          CustomNotificationList(),
        ],
      ),
    );
  }
}
