import 'package:get_it/get_it.dart';
import 'package:shopi/core/app/app_cubit/app_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  await setupAppCubit();
}

Future<void> setupAppCubit() async {
  getIt.registerFactory<AppCubit>(AppCubit.new);
}
