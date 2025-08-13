import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/constants/lang_keys.dart';
import 'package:shopi/core/extensions/context_ext.dart';
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
          CustomFadeInUp(
            duration: 500,
            child: CustomTextField(
              hintText: (LangKeys.fullName.tr()),
              obscureText: true,
              validator: (value) {
                return Validators.validateRequired(
                  value,
                  (LangKeys.validName.tr()),
                );
              },

              controller: TextEditingController(),
            ),
          ),
          AppSpacing.v24,
          CustomFadeInUp(
            duration: 550,
            child: CustomTextField(
              hintText: (LangKeys.email.tr()),
              controller: TextEditingController(),
              validator: (value) {
                return Validators.validateEmail(
                  value,
                  (LangKeys.validEmail.tr()),
                );
              },
            ),
          ),

          AppSpacing.v24,
          CustomFadeInUp(
            duration: 600,
            child: CustomTextField(
              hintText: (LangKeys.password.tr()),
              obscureText: isObscure,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                    icon = !isObscure ? Icons.visibility : Icons.visibility_off;
                  });
                },
                icon: Icon(icon, color: context.color.textFormBorder),
              ),
              validator: (value) {
                return Validators.validatePassword(
                  value,
                  (LangKeys.validPasswrod.tr()),
                );
              },
              controller: TextEditingController(),
            ),
          ),
        ],
      ),
    );
  }
}
