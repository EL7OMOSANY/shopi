import 'package:flutter/material.dart';
import 'package:shopi/core/style/colors/dark_colors.dart';

class CustomButtomSheet {
  const CustomButtomSheet._();
  static void showModalBottomSheetContainer({
    required BuildContext context,
    required Widget widget,
    Color? backgroundColor,
    VoidCallback? whenComplete,
  }) => showModalBottomSheet<dynamic>(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    context: context,
    backgroundColor: backgroundColor ?? ColorsDark.mainColor,
    isScrollControlled: true,
    barrierColor: Colors.transparent,
    builder: (context) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
          ),

          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? ColorsDark.mainColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              border: Border.all(
                color: Colors.white.withOpacity(0.8),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  blurRadius: 12,
                  spreadRadius: 2,
                  offset: const Offset(0, -2),
                ),
              ],
            ),

            padding: const EdgeInsets.all(16),
            child: widget,
          ),
        ),
      );
    },
  ).whenComplete(whenComplete ?? () {});
}
