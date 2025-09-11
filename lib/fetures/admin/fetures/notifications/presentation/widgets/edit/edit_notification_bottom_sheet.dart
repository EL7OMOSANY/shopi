import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/style/colors/dark_colors.dart';
import 'package:shopi/core/widgets/custom_button.dart';
import 'package:shopi/core/widgets/custom_text_field.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/admin/fetures/notifications/data/models/add_notification_model.dart';

class EditNotificationBottomSheet extends StatefulWidget {
  const EditNotificationBottomSheet({
    required this.notificationModel,
    super.key,
  });

  final NotificationModel notificationModel;

  @override
  State<EditNotificationBottomSheet> createState() =>
      _EditNotificationBottomSheetState();
}

class _EditNotificationBottomSheetState
    extends State<EditNotificationBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController productIdController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.notificationModel.title;
    bodyController.text = widget.notificationModel.body;
    productIdController.text = widget.notificationModel.productId.toString();
  }

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
                text: 'Edit Notifications',
                style: AppTextStyles.text20w700.copyWith(
                  color: context.color.textColor,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            //Enter the Notification name title
            TextApp(
              text: 'Edit the Notification title',
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
              text: 'Edit the Notification body',
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
              text: 'Edit the Product Id',
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
                return null;
              },
              hintText: 'Produc id',
            ),
            SizedBox(height: 20.h),
            //Button
            CustomButton(
              onPressed: () {
                _validAddNotification(context);
              },
              backgroundColor: ColorsDark.white,
              lastRadius: 20,
              threeRadius: 20,
              textColor: ColorsDark.blueDark,
              text: 'Edit a Notification',
              width: MediaQuery.of(context).size.width,
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }

  void _validAddNotification(BuildContext context) {
    if (formKey.currentState!.validate()) {
      widget.notificationModel.title = titleController.text.isEmpty
          ? widget.notificationModel.title
          : titleController.text.trim();
      widget.notificationModel.body = bodyController.text.isEmpty
          ? widget.notificationModel.body
          : bodyController.text.trim();
      widget.notificationModel.productId = productIdController.text.isEmpty
          ? widget.notificationModel.productId
          : int.parse(productIdController.text.trim());

      widget.notificationModel.save();
      context.pop();
    }
  }
}
