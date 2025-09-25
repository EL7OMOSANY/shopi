import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/app/app_cubit/app_state.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  bool isDark = false;
  String currentLang = 'en';

  /// ============ Theme Mode ============
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

  /// ============ Language ============
  void getSavedLanguage() {
    final result =
        SharedPref().containPreference(SharedPrefKeys.currentLangCode)
        ? SharedPref().getString(SharedPrefKeys.currentLangCode)
        : 'en';

    currentLang = result!;
    emit(AppLanguageChangeed(sharedLanguage: Locale(currentLang)));
  }

  Future<void> _changeLang(String langCode) async {
    await SharedPref().setString(SharedPrefKeys.currentLangCode, langCode);
    currentLang = langCode;
    emit(AppLanguageChangeed(sharedLanguage: Locale(currentLang)));
  }

  void toArabic() => _changeLang('ar');
  void toEnglish() => _changeLang('en');

  //   /// ============ Deep Links ============
  //   Future<void> initDeepLinks(BuildContext context) async {
  //     // Cold start
  //     final initialUri = await _appLinks.getInitialLink();
  //     if (initialUri != null) {
  //       // ignore: use_build_context_synchronously
  //       _handleUri(initialUri, context);
  //     }

  //     // Listen for runtime links
  //     _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
  //       // ignore: use_build_context_synchronously
  //       _handleUri(uri, context);
  //     });
  //   }

  //   void _handleUri(Uri uri, BuildContext context) {
  //     debugPrint("🔗 Received URI: $uri");

  //     if (uri.pathSegments.contains("product")) {
  //       final productId = uri.pathSegments.last;
  //       Navigator.pushNamed(
  //         context,
  //         Routes.customerProductDetails,
  //         arguments: productId,
  //       );
  //     }
  //   }

  //   void disposeDeepLinks() {
  //     _linkSubscription?.cancel();
  //   }
}
