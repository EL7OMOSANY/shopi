import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/app.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/helpers/bloc_observer_helper.dart';
import 'package:flutter/material.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await SharedPref().instantiatePreferences();
  await setupDependencyInjection();
  await EasyLocalization.ensureInitialized();

  // String savedLang =
  //     await SharedPref().getString(SharedPrefKeys.currentLangCode) ?? 'en';

  runApp(
    EasyLocalization(
      path: 'assets/langs',
      supportedLocales: const [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('en'),
      startLocale: Locale("en"),
      saveLocale: true,

      child: const MyApp(),
    ),
  );
}
