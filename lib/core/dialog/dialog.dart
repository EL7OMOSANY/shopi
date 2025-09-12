import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/widgets/custom_button.dart';
import 'package:shopi/core/widgets/text_app.dart';

class CustomDialog {
  const CustomDialog._();

  static void twoButtonDialog({
    required BuildContext context,
    required String textBody,
    required String textButton1,
    required String textButton2,
    required void Function() onPressed,
    required bool isLoading,
  }) {
    showDialog<dynamic>(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey,
        title: Padding(
          padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
          child: Center(
            child: TextApp(
              text: textBody,
              style: AppTextStyles.text16w400.copyWith(color: Colors.black),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        actions: [
          CustomButton(
            backgroundColor: Colors.red,
            onPressed: onPressed,
            text: textButton1,
            width: 320.w,
            height: 45.h,
            isLoading: isLoading,
            lastRadius: 10,
            threeRadius: 10,
          ),
          SizedBox(height: 10.h, width: 1.w),
          CustomButton(
            onPressed: () {
              context.pop();
            },
            text: textButton2,
            width: 320.w,
            height: 45.h,
            lastRadius: 10,
            threeRadius: 10,
          ),
        ],
      ),
    );
  }
}
