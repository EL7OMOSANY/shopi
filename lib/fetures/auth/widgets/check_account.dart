import 'package:flutter/material.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/color_extension.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextApp(text: text, style: AppTextStyles.text14w400),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: AppTextStyles.text14w700.copyWith(
              color: MyColors.light.mainColor,
            ),
          ),
        ),
      ],
    );
  }
}
