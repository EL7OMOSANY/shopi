import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/utils/toast_utils.dart';
import 'package:shopi/core/widgets/custom_linear_button.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/auth/login/presentaion/widgets/login_button.dart';
import 'package:shopi/fetures/auth/signup/presentation/logic/cubit/signup_cubit.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();
    return CustomFadeInUp(
      duration: 650,
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            ToastUtils.showSuccess(
              context,
              title: LangKeys.congratulations,
              message: LangKeys.plsSignIn,
            );
            //////////

            String role = getRole(SharedPrefKeys.userRole);
            log(" role in signup button : $role");
            context.pop();
          } else if (state is SignupError) {
            ToastUtils.showError(
              context,
              message: state.message,
              title: LangKeys.loggedError,
            );
          }
        },
        builder: (context, state) {
          return state is SignupLoading
              ? CustomLinearButton(
                  width: double.infinity.w,
                  height: 50.h,
                  onPressed: () {},
                  child: Center(
                    child: CircularProgressIndicator(
                      color: context.color.mainColor,
                    ),
                  ),
                )
              : CustomLinearButton(
                  width: double.infinity.w,
                  height: 50.h,
                  onPressed: () {
                    if (signupCubit.formKey.currentState!.validate()) {
                      signupCubit.signUp();
                    }
                  },
                  child: TextApp(
                    text: context.tr(LangKeys.signUp),
                    style: AppTextStyles.text16w700.copyWith(
                      color: context.color.mainColor,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
