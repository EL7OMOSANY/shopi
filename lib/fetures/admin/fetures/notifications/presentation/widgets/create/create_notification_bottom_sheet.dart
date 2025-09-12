import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/style/colors/dark_colors.dart';
import 'package:shopi/core/utils/toast_utils.dart';
import 'package:shopi/core/widgets/custom_button.dart';
import 'package:shopi/core/widgets/custom_text_field.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/admin/fetures/notifications/data/models/add_notification_model.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/notification_cubit/cubit/notification_cubit.dart';

class CreateNotificationBottomSheet extends StatefulWidget {
  const CreateNotificationBottomSheet({super.key});

  @override
  State<CreateNotificationBottomSheet> createState() =>
      _CreateNotificationBottomSheetState();
}

class _CreateNotificationBottomSheetState
    extends State<CreateNotificationBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController productIdController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    productIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Add Notifications Title
            Center(
              child: TextApp(
                text: 'Add Notifications',
                style: AppTextStyles.text20w700.copyWith(
                  color: context.color.textColor,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            //Enter the Notification name title
            TextApp(
              text: 'Enter the Notification title',
              style: AppTextStyles.text16w500.copyWith(
                color: context.color.textColor,
              ),
            ),
            SizedBox(height: 20.h),
            // title for notification TextForm
            CustomTextField(
              controller: titleController,
              hintText: 'Title',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Please Selected Your Title Name';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),

            //Enter the Notification name body
            TextApp(
              text: 'Enter the Notification body',
              style: AppTextStyles.text16w500.copyWith(
                color: context.color.textColor,
              ),
            ),
            SizedBox(height: 20.h),
            // Body for notification TextForm
            CustomTextField(
              controller: bodyController,
              hintText: 'Body',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Please Selected Your Body Name';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            //Enter the Product Id
            TextApp(
              text: 'Enter the Product Id',
              style: AppTextStyles.text16w500.copyWith(
                color: context.color.textColor,
              ),
            ),
            SizedBox(height: 20.h),
            // productId for notification TextForm
            CustomTextField(
              controller: productIdController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Selected Your Productid ';
                }
                return null;
              },
              hintText: 'Produc id',
            ),
            SizedBox(height: 20.h),
            //Button
            BlocConsumer<NotificationCubit, NotificationState>(
              listener: (context, state) {
                if (state is CreateNotificationError) {
                  ToastUtils.showError(
                    context,
                    message: state.message,
                    title: 'Failed',
                  );
                } else if (state is CreateNotificationSuccess) {
                  context.pop();
                  ToastUtils.showSuccess(
                    context,
                    message: 'Notification Created Success',
                    title: 'Success',
                  );
                }
              },
              builder: (context, state) {
                return state is CreateNotificationLoading
                    ? Container(
                        height: 50.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: ColorsDark.blueDark,
                          ),
                        ),
                      )
                    : CustomButton(
                        onPressed: () {
                          _validAddNotification(context);
                        },
                        // ignore: deprecated_member_use
                        backgroundColor: context.color.textFormBorder!
                            // ignore: deprecated_member_use
                            .withOpacity(.5),
                        lastRadius: 20,
                        textColor: ColorsDark.white,
                        text: 'Add a Notification',
                        width: MediaQuery.of(context).size.width,
                        height: 50.h,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _validAddNotification(BuildContext context) {
    final cubit = context.read<NotificationCubit>();
    if (formKey.currentState!.validate()) {
      cubit.createNotification(
        NotificationModel(
          title: titleController.text.trim(),
          body: bodyController.text.trim(),
          productId: int.parse(productIdController.text.trim()),
          createAt: DateTime.now(),
        ),
      );
    }
  }
}
