import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:shopi/fetures/auth/login/presentaion/widgets/sign_in_form_fields.dart';
import 'package:shopi/fetures/auth/login/presentaion/widgets/signin_button.dart';
import 'package:shopi/fetures/auth/widgets/check_account.dart';
import 'package:shopi/fetures/auth/widgets/head_and_caption_column.dart';
import 'package:shopi/fetures/auth/widgets/lang_and_theme_row.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LangAndThemeRow(),
                AppSpacing.v24,
                HeadAndCaptionColumn(
                  head: context.tr(LangKeys.signIn),
                  caption: context.tr(LangKeys.welcome),
                ),
                AppSpacing.v24,
                SignInFormFields(),
                AppSpacing.v24,
                SignInButton(),
                AppSpacing.v24,
                CheckAccount(
                  text: context.tr(LangKeys.createAccount),
                  buttonText: context.tr(LangKeys.signUp),
                  onPressed: () {
                    context.pushName(Routes.register);
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
