import 'package:flutter/material.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
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
      child: Column(
        children: [
          CustomTextField(
            hintText: "Email",
            hintStyle: AppTextStyles.text14w400,
            controller: TextEditingController(),
            validator: (value) {
              return Validators.validateEmail(value, "Email is required");
            },
          ),
          AppSpacing.v24,
          CustomTextField(
            hintText: "Password",
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
              return Validators.validatePassword(value, "Password is required");
            },
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }
}
