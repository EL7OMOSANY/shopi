import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/fetures/auth/signup/presentation/widgets/signup_button.dart';
import 'package:shopi/fetures/auth/signup/presentation/widgets/signup_form_fields.dart';
import 'package:shopi/fetures/auth/widgets/check_account.dart';
import 'package:shopi/fetures/auth/widgets/head_and_caption_column.dart';
import 'package:shopi/fetures/auth/widgets/lang_and_theme_row.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LangAndThemeRow(),
                AppSpacing.v24,
                CircleAvatar(radius: 50.r),
                AppSpacing.v24,
                HeadAndCaptionColumn(
                  head: "Sign Up",
                  caption: "Create an account to continue",
                ),
                AppSpacing.v24,
                SignupFormFields(),
                AppSpacing.v24,
                SignupButton(),

                AppSpacing.v24,
                CheckAccount(
                  text: 'Already have an account?',
                  buttonText: 'Sign In',
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
