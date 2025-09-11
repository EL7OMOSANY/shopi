import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/extensions/date_extention.dart';
import 'package:shopi/core/widgets/custom_admin_container.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/admin/fetures/notifications/data/models/add_notification_model.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/widgets/delete/delete_notification_widget.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/widgets/edit/edit_notification.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/widgets/send/send_notification_widget.dart';

class AddNotificationItem extends StatelessWidget {
  const AddNotificationItem({
    required this.notificationModel,
    required this.index,
    super.key,
  });

  final NotificationModel notificationModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 180.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Column(
          children: [
            const Spacer(),
            //Title
            NotificationInfo(title: 'Tilte: ', body: notificationModel.title),
            const Spacer(),
            //Body
            NotificationInfo(title: 'Body: ', body: notificationModel.body),
            const Spacer(),
            NotificationInfo(
              title: 'Create At: ',
              body: notificationModel.createAt.getFormatDayMonthYear(),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //delete notification
                DeleteNotificationWidget(
                  notificationModel: notificationModel,
                  indx: index,
                ),
                SizedBox(width: 40.w),
                //Edit notification
                EditNotification(notificationModel: notificationModel),
                SizedBox(width: 40.w),
                // send notification
                SendNotificationWidget(
                  notificationModel: notificationModel,
                  index: index,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationInfo extends StatelessWidget {
  const NotificationInfo({required this.title, required this.body, super.key});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextApp(
          text: title,
          style: AppTextStyles.text14w500.copyWith(
            color: context.color.textColor,
          ),
        ),
        SizedBox(height: 8.w),
        Flexible(
          child: TextApp(
            text: body,
            style: AppTextStyles.text14w500.copyWith(
              color: context.color.textColor,
            ),
          ),
        ),
      ],
    );
  }
}
