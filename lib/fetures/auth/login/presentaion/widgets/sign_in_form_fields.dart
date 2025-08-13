import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/constants/lang_keys.dart';
import 'package:shopi/core/utils/validators.dart';

import '../../../../../core/constants/app_spacer.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class SignInFormFields extends StatefulWidget {
  const SignInFormFields({super.key});

  @override
  State<SignInFormFields> createState() => _SignInFormFieldsState();
}

class _SignInFormFieldsState extends State<SignInFormFields> {
  bool isObscure = true;
  IconData icon = Icons.visibility;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: CustomFadeInUp(
        duration: 500,
        child: Column(
          children: [
            CustomTextField(
              hintText: (LangKeys.email.tr()),
              hintStyle: AppTextStyles.text14w400,
              controller: TextEditingController(),
              validator: (value) {
                return Validators.validateEmail(value, (LangKeys.validEmail.tr()));
              },
            ),
            AppSpacing.v24,
            CustomTextField(
              hintText:(LangKeys.password.tr()),
              hintStyle: AppTextStyles.text14w400,
              obscureText: isObscure,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                    icon = !isObscure ? Icons.visibility : Icons.visibility_off;
                  });
                },
                icon: Icon(icon),
              ),
              validator: (value) {
                return Validators.validatePassword(value,(LangKeys.validPasswrod.tr()));
              },
              controller: TextEditingController(),
            ),
          ],
        ),
      ),
    );
  }
}
