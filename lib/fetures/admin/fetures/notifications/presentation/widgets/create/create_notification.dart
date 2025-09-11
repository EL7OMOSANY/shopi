import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/buutom_sheet/custom_buttom_sheet.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/style/colors/dark_colors.dart';
import 'package:shopi/core/widgets/custom_button.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/notification_cubit/cubit/notification_cubit.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/widgets/create/create_notification_bottom_sheet.dart';

class CreateNotification extends StatelessWidget {
  const CreateNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // titile
        TextApp(
          text: 'Notifications',
          style: AppTextStyles.text18w500.copyWith(
            color: context.color.textColor,
          ),
        ),
        // bottom sheet
        CustomButton(
          onPressed: () {
            CustomButtomSheet.showModalBottomSheetContainer(
              context: context,
              widget: BlocProvider(
                create: (context) => getIt<NotificationCubit>(),
                child: const CreateNotificationBottomSheet(),
              ),
              whenComplete: () {
                context.read<NotificationCubit>().getAllNotifications();
              },
            );
          },
          backgroundColor: ColorsDark.blueDark,
          lastRadius: 10,
          threeRadius: 10,
          text: 'Add',
          width: 90.w,
          height: 35.h,
        ),
      ],
    );
  }
}
