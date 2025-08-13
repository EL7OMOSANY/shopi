import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/constants/lang_keys.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/fetures/auth/signup/presentation/widgets/prfile_image.dart';
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
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LangAndThemeRow(),
                AppSpacing.v24,
                ProfileImage(),
                AppSpacing.v24,
                HeadAndCaptionColumn(
                  head:(LangKeys.signUp.tr()),
                  caption: (LangKeys.createAccount.tr()),
                ),
                AppSpacing.v24,
                SignupFormFields(),
                AppSpacing.v24,
                SignupButton(),

                AppSpacing.v24,
                CustomFadeInUp(
                  duration: 700,
                  child: CheckAccount(
                    text: (LangKeys.youHaveAccount.tr()),
                    buttonText: (LangKeys.signIn.tr()),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
