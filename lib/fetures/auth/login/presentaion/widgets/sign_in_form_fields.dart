import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/utils/validators.dart';
import 'package:shopi/fetures/auth/login/presentaion/login_cubit/login_cubit.dart';

import '../../../../../core/constants/app_spacer.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class SignInFormFields extends StatefulWidget {
  const SignInFormFields({super.key});

  @override
  State<SignInFormFields> createState() => _SignInFormFieldsState();
}

class _SignInFormFieldsState extends State<SignInFormFields> {
  bool isObscure = true;
  IconData icon = Icons.visibility_off;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.formKey,
      child: CustomFadeInUp(
        duration: 500,
        child: Column(
          children: [
            CustomTextField(
              hintText: context.tr(LangKeys.email),
              controller: cubit.emailController,
              validator: (value) {
                return Validators.validateEmail(
                  value,
                  context.tr(LangKeys.validEmail),
                );
              },
            ),
            AppSpacing.v24,
            CustomTextField(
              hintText: context.tr(LangKeys.password),
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
                  context.tr(LangKeys.validPassword),
                );
              },
              controller: cubit.passwordController,
            ),
          ],
        ),
      ),
    );
  }
}
