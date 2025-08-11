import 'package:flutter/material.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/utils/validators.dart';
import 'package:shopi/core/widgets/custom_text_field.dart';

class SignupFormFields extends StatefulWidget {
  const SignupFormFields({super.key});

  @override
  State<SignupFormFields> createState() => _SignupFormFieldsState();
}

class _SignupFormFieldsState extends State<SignupFormFields> {
  IconData icon = Icons.visibility_off;
  //observer
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: ,
      child: Column(
        children: [
          CustomTextField(
            hintText: "Name",
            hintStyle: AppTextStyles.text14w400,
            obscureText: true,
            validator: (value) {
              return Validators.validateRequired(value, "Password is required");
            },

            controller: TextEditingController(),
          ),
          AppSpacing.v24,
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
