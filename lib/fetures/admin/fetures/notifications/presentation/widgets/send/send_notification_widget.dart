import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/utils/toast_utils.dart';
import 'package:shopi/fetures/admin/fetures/notifications/data/models/add_notification_model.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/notification_cubit/cubit/notification_cubit.dart';

class SendNotificationWidget extends StatelessWidget {
  const SendNotificationWidget({
    required this.notificationModel,
    required this.index,
    super.key,
  });

  final NotificationModel notificationModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationCubit>();
    return BlocConsumer<NotificationCubit, NotificationState>(
      listener: (context, state) {
        if (state is SendNotificationSuccess) {
          ToastUtils.showSuccess(
            title: 'Success',
            context,
            message: 'Your notifications have been send successfully',
          );
        } else if (state is SendNotificationError) {
          ToastUtils.showError(
            title: 'Failed',
            context,
            message: state.message,
          );
        }
      },
      builder: (context, state) {
        return state is SendNotificationLoading
            ? SizedBox(
                height: 25.h,
                width: 25.w,
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              )
            : InkWell(
                onTap: () {
                  cubit.sendNotification(
                    notificationModel: NotificationModel(
                      title: notificationModel.title,
                      body: notificationModel.body,
                      productId: notificationModel.productId,
                      createAt: DateTime.now(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.send_rounded,
                  color: Colors.green,
                  size: 25,
                ),
              );
      },
    );
  }
}
