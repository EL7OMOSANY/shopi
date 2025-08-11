import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/app.dart';
import 'package:shopi/core/helpers/bloc_observer_helper.dart';
import 'package:flutter/material.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await ScreenUtil.ensureScreenSize();

//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   runApp(const MyApp());
// }

void main() {
  runApp(const MyApp());
  Bloc.observer = BlocObserverHelper();
}
