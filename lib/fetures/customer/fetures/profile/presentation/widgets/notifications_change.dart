import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/services/push_notification/firebase_messaging_handeler.dart';
import 'package:shopi/core/utils/toast_utils.dart';
import 'package:shopi/core/widgets/text_app.dart';

class NotificationsChange extends StatelessWidget {
  const NotificationsChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.notifications_active, color: context.color.textColor),
        SizedBox(width: 10.w),
        TextApp(
          text: context.tr(LangKeys.notifications),
          style: AppTextStyles.text18w400.copyWith(
            color: context.color.textColor,
          ),
        ),
        const Spacer(),

        // radio buttons
        ValueListenableBuilder(
          valueListenable: FirebaseMessagingHandler.isNotificationSubscribe,
          builder: (_, value, __) {
            return Transform.scale(
              scale: 0.75,
              child: Switch.adaptive(
                value: value,
                inactiveTrackColor: const Color(0xff262626),
                activeColor: Colors.green,
                onChanged: (enabled) async {
                  if (enabled) {
                    await FirebaseMessagingHandler.subscribeNotification();
                    ToastUtils.showInfo(
                      context,
                      title: 'Notifications Enabled',
                      message: 'You will receive notifications from now on.',
                    );
                  } else {
                    await FirebaseMessagingHandler.unSubscribeNotification();
                    ToastUtils.showInfo(
                      context,
                      title: 'Notifications Disabled',
                      message: 'You will not receive notifications.',
                    );
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
