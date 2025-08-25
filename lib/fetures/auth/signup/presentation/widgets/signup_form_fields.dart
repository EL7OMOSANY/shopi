import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/utils/validators.dart';
import 'package:shopi/core/widgets/custom_text_field.dart';
import 'package:shopi/fetures/auth/signup/presentation/logic/cubit/signup_cubit.dart';

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
    final cubit = context.read<SignupCubit>();
    return Form(
      key: cubit.formKey,
      child: CustomFadeInUp(
        duration: 500,
        child: Column(
          children: [
            CustomTextField(
              hintText: context.tr(LangKeys.fullName),
              controller: cubit.nameController,
              validator: (value) {
                return Validators.validateUsername(
                  value,
                  context.tr(LangKeys.validName),
                );
              },
            ),
            AppSpacing.v24,

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
