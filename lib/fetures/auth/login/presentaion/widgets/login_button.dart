import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/routes/routes.dart';
import 'package:shopi/core/widgets/custom_linear_button.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/auth/login/presentaion/login_cubit/login_cubit.dart';

import '../../../../../core/utils/toast_utils.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return CustomFadeInUp(
      duration: 600,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ToastUtils.showSuccess(
              context,
              title: LangKeys.loggedSuccessfully,
              message: "Welcome back!",
            );

            String role = getRole(state.role);

            log("role in login button : $role");

            if (role == 'admin') {
              // Navigate to admin home screen
              context.pushNamedAndRemoveUntil(Routes.adminHome);
            } else {
              // Handle other roles if necessary
              context.pushNamedAndRemoveUntil(Routes.customerMain);
            }
          } else if (state is LoginError) {
            // show error message
            ToastUtils.showError(
              context,
              title: LangKeys.loggedError,
              message: "sorry, password or email is wrong",
            );
          }
        },
        builder: (context, state) {
          return
          // state is LoginLoading
          state is LoginLoading
              ? CustomLinearButton(
                  width: double.infinity.w,
                  height: 50.h,
                  onPressed: () {},
                  child: CircularProgressIndicator(
                    color: context.color.mainColor,
                  ),
                )
              : // CustomFadeInUp is a custom animation widget
                CustomLinearButton(
                  width: double.infinity.w,
                  height: 50.h,
                  onPressed: () {
                    if (cubit.formKey.currentState?.validate() ?? false) {
                      cubit.login();
                    }
                  },
                  child: TextApp(
                    text: context.tr(LangKeys.signIn),
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

String getRole(String role) {
  // Simulate a network call or any asynchronous operation
  role = SharedPref().getString(SharedPrefKeys.userRole) ?? "";
  return role;
}
