import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/widgets/custom_linear_button.dart';
import 'package:shopi/core/widgets/text_app.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 600,
      child: CustomLinearButton(
        width: double.infinity.w,
        height: 50.h,
        onPressed: () {},
        child: TextApp(
          text: context.tr(LangKeys.signIn),
          style: AppTextStyles.text16w700.copyWith(
            color: context.color.mainColor,
          ),
        ),
      ),
    );
  }
}
