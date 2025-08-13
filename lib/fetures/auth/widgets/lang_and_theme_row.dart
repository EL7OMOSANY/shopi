import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/app/app_cubit/app_cubit.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/constants/lang_keys.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/widgets/custom_linear_button.dart';
import 'package:shopi/core/widgets/text_app.dart';

class LangAndThemeRow extends StatelessWidget {
  const LangAndThemeRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Dark Mode Button
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return CustomFadeInLeft(
              duration: 400,
              child: CustomLinearButton(
                onPressed: cubit.changeAppTheme,
                child: Icon(
                  cubit.isDark
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                  color: context.color.mainColor,
                ),
              ),
            );
          },
        ),
        //Language Button
        CustomFadeInRight(
          duration: 400,
          child: CustomLinearButton(
            onPressed: () {
              if (context.locale.languageCode == 'en') {
                cubit.toArabic(context);
              } else {
                cubit.toEnglish(context);
              }
            },
            height: 44.h,
            width: 100.w,
            child: TextApp(
              text: (LangKeys.language.tr()),
              style: AppTextStyles.text14w700.copyWith(
                color: context.color.mainColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
