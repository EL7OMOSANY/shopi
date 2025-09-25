import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:shopi/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/helpers/bloc_observer_helper.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';
import 'package:shopi/core/services/hive/hive_database.dart';
import 'package:shopi/core/services/push_notification/firebase_messaging_handeler.dart';
import 'package:shopi/core/services/push_notification/local_notfication_service.dart';

Future<void> main() async {
  // initialize widget binding
  WidgetsFlutterBinding.ensureInitialized();

  // initialize bloc observer
  Bloc.observer = AppBlocObserver();

  // initialize dependency injection
  await setupDependencyInjection();

  // initialize shared preferences
  await SharedPref().instantiatePreferences();

  // initialize localization
  await FlutterLocalization.instance.ensureInitialized();

  // initialize firebase
  await Firebase.initializeApp();

  // firebase cloud messaging for specific users (admins or customers)
  String role = SharedPref().getString(SharedPrefKeys.userRole) ?? '';

  if (role == "customer") {
    await FirebaseMessaging.instance.subscribeToTopic("customers");
  } else if (role == "admin") {
    await FirebaseMessaging.instance.subscribeToTopic("admins");
  }
  await FirebaseMessagingHandler.init();
  await LocalNotificationService.init();

  // initialize hive
  await HiveDatabase().setup();

  runApp(const Shopi());
}
