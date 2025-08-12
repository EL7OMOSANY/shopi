import 'package:flutter/material.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/widgets/text_app.dart';

class CheckAccount extends StatelessWidget {
  const CheckAccount({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onPressed,
  });
  final String text;
  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 700,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextApp(
            text: text,
            style: AppTextStyles.text14w400.copyWith(
              color: context.color.textFormBorder,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: AppTextStyles.text14w700.copyWith(
                color: context.color.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
