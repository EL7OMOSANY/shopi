import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/app/app_cubit/app_state.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());
  bool isDark = true;
  String currentLang = 'en';
  //Theme Mode
  Future<void> changeAppTheme({bool? sharedTheme}) async {
    emit(AppInitialState());

    if (sharedTheme != null) {
      isDark = sharedTheme;
      await SharedPref().setBoolean(SharedPrefKeys.isDark, isDark);
      emit(AppThemeChangeed(sharedTheme: isDark));
    } else {
      isDark = !isDark;
      await SharedPref().setBoolean(SharedPrefKeys.isDark, isDark);
      emit(AppThemeChangeed(sharedTheme: isDark));
    }
  }
  ///////////////////////////////////////////////////////////////////

  //Language Change
  void getSavedLanguage() {
    final result =
        SharedPref().containPreference(SharedPrefKeys.currentLangCode)
        ? SharedPref().getString(SharedPrefKeys.currentLangCode)
        : 'en';

    currentLang = result!;

    emit(AppLanguageChangeed(sharedLanguage: Locale(currentLang)));
  }

  // Future<void> _changeLang(BuildContext context, String langCode) async {
  //   await SharedPref().setString(SharedPrefKeys.currentLangCode, langCode);
  //   currentLang = langCode;

  //   // ignore: use_build_context_synchronously
  //   await context.setLocale(Locale(langCode));

  //   if (!isClosed) {
  //     emit(AppLanguageChangeed(sharedLanguage: Locale(currentLang)));
  //   }
  // }

  // void toArabic(BuildContext context) => _changeLang(context, 'ar');
  // void toEnglish(BuildContext context) => _changeLang(context, 'en');
  // حفظ اللغة
  Future<void> changeLanguage(BuildContext context, String langCode) async {
    await SharedPref().setString(SharedPrefKeys.currentLangCode, langCode);

    // تحديث EasyLocalization مباشرة
    // ignore: use_build_context_synchronously
    await context.setLocale(Locale(langCode));

    currentLang = langCode;

    if (!isClosed) {
      emit(AppLanguageChangeed(sharedLanguage: Locale(currentLang)));
    }
  }

  void toArabic(BuildContext context) => changeLanguage(context, 'ar');
  void toEnglish(BuildContext context) => changeLanguage(context, 'en');

  ///////////////////////////////////////////////////////////////////////
}
