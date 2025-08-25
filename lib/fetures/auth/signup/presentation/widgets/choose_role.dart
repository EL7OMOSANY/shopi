import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
import 'package:shopi/core/enums/role_enum.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/fetures/auth/login/presentaion/widgets/login_button.dart';
import 'package:shopi/fetures/auth/signup/presentation/logic/cubit/signup_cubit.dart';

class ChooseRole extends StatefulWidget {
  const ChooseRole({super.key});

  @override
  State<ChooseRole> createState() => _ChooseRole();
}

class _ChooseRole extends State<ChooseRole> {
  String? selectedRole;

  @override
  void initState() {
    super.initState();
    selectedRole = AppRole.customer.name;
    context.read<SignupCubit>().userRole = AppRole.customer.name;
  }

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignupCubit>();
    return Row(
      children: [
        _buildRoleButton(
          image: "assets/images/admin/users_drawer.png",
          onTap: () {
            setState(() {
              selectedRole = AppRole.customer.name;
            });
            signUpCubit.userRole = AppRole.customer.name;
            // save in shared pref
            SharedPref.preferences.setString(
              SharedPrefKeys.userRole,
              "customer",
            );
            log("Selected Role: $selectedRole");
          },
          displayLabel: context.tr(LangKeys.customer),
          roleValue: AppRole.customer.name,
        ),
        AppSpacing.h24,
        Text(
          context.tr(LangKeys.or),
          style: AppTextStyles.text14w400.copyWith(
            color: context.color.textColor,
          ),
        ),
        AppSpacing.h24,
        _buildRoleButton(
          image: "assets/images/admin/products_drawer.png",
          onTap: () {
            setState(() {
              selectedRole = AppRole.admin.name;
            });
            signUpCubit.userRole = AppRole.admin.name;

            // save in shared pref
            SharedPref.preferences.setString(SharedPrefKeys.userRole, "admin");
            String role = getRole(selectedRole ?? "");
            log("Selected Role in role selection: $role");
          },
          displayLabel: context.tr(LangKeys.admin),
          roleValue: AppRole.admin.name,
        ),
      ],
    );
  }

  Widget _buildRoleButton({
    required String image,
    required String displayLabel,
    required String roleValue,
    required void Function()? onTap,
  }) {
    bool isSelected = selectedRole == roleValue;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.w),
          decoration: BoxDecoration(
            color: context.color.containerLinear1,
            borderRadius: BorderRadius.circular(12),
            border: isSelected
                ? Border.all(color: Colors.white, width: 1)
                : null,
            boxShadow: !isSelected
                ? [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: context.color.bluePinkLight!.withOpacity(0.5),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 24.w,
                height: 24.h,
                child: Image.asset(image, width: 24.w, height: 24.h),
              ),
              AppSpacing.h8,
              Text(
                displayLabel,
                style: AppTextStyles.text14w400.copyWith(
                  color: isSelected
                      ? Colors.white
                      // ignore: deprecated_member_use
                      : context.color.bluePinkLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*

 */
