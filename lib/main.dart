import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:shopi/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
// import 'package:shopi/core/app/env_variables.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/helpers/bloc_observer_helper.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';
import 'package:shopi/core/services/hive/hive_database.dart';
import 'package:shopi/core/services/push_notification/firebase_messaging_handeler.dart';
import 'package:shopi/core/services/push_notification/local_notfication_service.dart';

// ignore: strict_top_level_inference
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await setupDependencyInjection();
  await SharedPref().instantiatePreferences();
  await FlutterLocalization.instance.ensureInitialized();
  await Firebase.initializeApp();
  await Firebase.initializeApp();
  String role = SharedPref().getString(SharedPrefKeys.userRole) ?? '';

  if (role == "customer") {
    await FirebaseMessaging.instance.subscribeToTopic("customers");
  } else if (role == "admin") {
    await FirebaseMessaging.instance.subscribeToTopic("admins");
  }
  await FirebaseMessagingHandler.init();
  await LocalNotificationService.init();
  HiveDatabase().setup();
  // await EnvVariable.instance.init(envType: EnvTypeEnum.dev);
  runApp(const Shopi());
}
