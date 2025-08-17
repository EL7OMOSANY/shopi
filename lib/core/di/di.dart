import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopi/core/app/app_cubit/app_cubit.dart';
import 'package:shopi/core/services/graphql/api_service.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  initApp();
}

void initApp() {
  getIt.registerFactory<AppCubit>(() => AppCubit());
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));
}
