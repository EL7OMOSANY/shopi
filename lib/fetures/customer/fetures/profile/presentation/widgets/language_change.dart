import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopi/core/app/app_cubit/app_cubit.dart';
import 'package:shopi/core/constants/app_images.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/dialog/dialog.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/langs/app_localization.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/widgets/text_app.dart';

class LanguageChange extends StatelessWidget {
  const LanguageChange({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return Row(
          children: [
            SvgPicture.asset(
              AppImages.language,
              // ignore: deprecated_member_use
              color: context.color.textColor,
            ),
            SizedBox(width: 10.w),
            TextApp(
              text: context.tr(LangKeys.languageTilte),
              style: AppTextStyles.text14w500.copyWith(
                color: context.color.textColor,
              ),
            ),
            const Spacer(),
            //language button
            InkWell(
              onTap: () {
                //dialog
                CustomDialog.twoButtonDialog(
                  context: context,
                  textBody: context.tr(LangKeys.changeToTheLanguage),
                  textButton1: context.tr(LangKeys.sure),
                  textButton2: context.tr(LangKeys.cancel),
                  isLoading: false,
                  onPressed: () {
                    selectLanguagesButton(context: context, cubit: cubit);
                  },
                );
              },
              child: Row(
                children: [
                  TextApp(
                    text: context.tr(LangKeys.langCode),
                    style: AppTextStyles.text14w500.copyWith(
                      color: context.color.textColor,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: context.color.textColor,
                    size: 15,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void selectLanguagesButton({
    required BuildContext context,
    required AppCubit cubit,
  }) {
    if (AppLocalizations.of(context)!.isEnLocale) {
      cubit.toArabic();
    } else {
      cubit.toEnglish();
    }
    context.pop();
  }
}
