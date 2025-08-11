import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';

class ToastUtils {
  static void showError(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    CherryToast.error(
      title: Text(title, style: AppTextStyles.text16w400),
      description: Text(message, style: AppTextStyles.text14w400),
      animationType: AnimationType.fromTop,
      animationDuration: const Duration(milliseconds: 1000),
      autoDismiss: true,
    ).show(context);
  }

  static void showSuccess(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    CherryToast.success(
      title: Text(title, style: AppTextStyles.text16w400),
      description: Text(message, style: AppTextStyles.text14w400),
      animationType: AnimationType.fromTop,
      animationDuration: const Duration(milliseconds: 1000),
      autoDismiss: true,
    ).show(context);
  }

  static void showInfo(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    CherryToast.info(
      title: Text(title, style: AppTextStyles.text16w400),
      description: Text(message, style: AppTextStyles.text14w400),
      animationType: AnimationType.fromTop,
      animationDuration: const Duration(milliseconds: 1000),
      autoDismiss: true,
    ).show(context);
  }

  static void showWarning(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    CherryToast.warning(
      title: Text(title, style: AppTextStyles.text16w400),
      description: Text(message, style: AppTextStyles.text14w400),
      animationType: AnimationType.fromTop,
      animationDuration: const Duration(milliseconds: 1000),
      autoDismiss: true,
    ).show(context);
  }
}
