import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/style/colors/dark_colors.dart';
import 'package:shopi/core/utils/toast_utils.dart';
import 'package:shopi/fetures/admin/fetures/notifications/data/models/add_notification_model.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/notification_cubit/cubit/notification_cubit.dart';

class DeleteNotificationWidget extends StatelessWidget {
  const DeleteNotificationWidget({
    required this.notificationModel,
    super.key,
    required this.indx,
  });

  final NotificationModel notificationModel;
  final int indx;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationCubit>();
    return BlocConsumer<NotificationCubit, NotificationState>(
      listener: (context, state) {
        if (state is DeleteNotificationError) {
          ToastUtils.showError(
            context,
            message: "Something went wrong",
            title: 'Error',
          );
        } else if (state is DeleteNotificationSuccess) {
          ToastUtils.showSuccess(
            context,
            message: "Notification has been deleted",
            title: 'Success',
          );
          cubit.getAllNotifications();
        }
      },
      builder: (context, state) {
        return state is DeleteNotificationLoading
            ? SizedBox(
                height: 15.h,
                width: 15.w,
                child: const CircularProgressIndicator(color: ColorsDark.white),
              )
            : InkWell(
                onTap: () {
                  context.read<NotificationCubit>().deleteNotification(indx);
                },
                child: const Icon(Icons.delete, color: Colors.red),
              );
      },
    );
  }
}
