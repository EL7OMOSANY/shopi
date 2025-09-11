import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/buutom_sheet/custom_buttom_sheet.dart';
import 'package:shopi/fetures/admin/fetures/notifications/data/models/add_notification_model.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/notification_cubit/cubit/notification_cubit.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/widgets/edit/edit_notification_bottom_sheet.dart';

class EditNotification extends StatelessWidget {
  const EditNotification({required this.notificationModel, super.key});

  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationCubit>();
    return InkWell(
      onTap: () {
        CustomButtomSheet.showModalBottomSheetContainer(
          context: context,
          widget: EditNotificationBottomSheet(
            notificationModel: notificationModel,
          ),
          whenComplete: () {
            cubit.getAllNotifications();
          },
        );
      },
      child: const Icon(Icons.edit, color: Colors.yellow),
    );
  }
}
