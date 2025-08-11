import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/widgets/custom_linear_button.dart';
import 'package:shopi/core/widgets/text_app.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLinearButton(
      width: double.infinity.w,
      height: 50.h,
      onPressed: () {},
      child: TextApp(text: 'Sign Up', style: AppTextStyles.text16w700),
    );
  }
}
