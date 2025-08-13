import 'package:flutter_localization/flutter_localization.dart';
import 'package:shopi/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/helpers/bloc_observer_helper.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await SharedPref().instantiatePreferences();
  await setupDependencyInjection();
  await FlutterLocalization.instance.ensureInitialized();
  runApp(const Shopi());
}
