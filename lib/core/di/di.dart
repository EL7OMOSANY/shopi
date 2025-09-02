import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopi/core/app/app_cubit/app_cubit.dart';
import 'package:shopi/core/app/upload_image_cubit/repo/upload_image_repo.dart';
import 'package:shopi/core/app/upload_image_cubit/upload_image_cubit.dart';
import 'package:shopi/core/services/graphql/api_service.dart';
import 'package:shopi/fetures/admin/fetures/category/data/repo/categories_repos.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/data/repo/dashboard_repos.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/presentation/cubit/cubit/dashboard_cubit.dart';
import 'package:shopi/fetures/auth/auth_repos/auth_repos.dart';
import 'package:shopi/fetures/auth/login/presentaion/login_cubit/login_cubit.dart';
import 'package:shopi/fetures/auth/signup/presentation/logic/cubit/signup_cubit.dart';

final GetIt getIt = GetIt.instance;
GetIt get getItInstance => getIt;

// Future<void> setupDependencyInjection() async {
//   // Dio
//   getIt.registerLazySingleton<Dio>(() => Dio());

//   // App
//   getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
//   getIt.registerFactory<AppCubit>(() => AppCubit());

//   // Login
//   getIt.registerLazySingleton<LoginRepository>(
//     () => LoginRepository(getIt<ApiService>(), getIt<Dio>()),
//   );
//   getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepository>()));
// }

Future<void> setupDependencyInjection() async {
  initApp();

  initAppAuth();

  dashboardInit();

  allcategoriesInit();
}

Future<void> initApp() async {
  // Dio
  getIt.registerSingleton<Dio>(Dio());
  log("✅ Dio registered");

  // App
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
  log("✅ ApiService registered");

  getIt.registerFactory<AppCubit>(() => AppCubit());
  log("✅ AppCubit registered");

  getIt.registerFactory<UploadImageCubit>(() => UploadImageCubit(getIt()));

  log("✅ UploadImageCubit registered");

  getIt.registerLazySingleton<UploadImageRepo>(() => UploadImageRepo(getIt()));

  log("✅ UploadImageRepo registered");
}

Future<void> initAppAuth() async {
  // Auth Repos
  getIt.registerLazySingleton<AuthRepos>(() => AuthRepos(getIt<ApiService>()));
  log("✅ AuthRepos registered");

  // Login
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepos>()));
  log("✅ LoginCubit registered");

  // SignUp
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<AuthRepos>()));
  log("✅ SignupCubit registered");
}

Future<void> dashboardInit() async {
  getIt.registerLazySingleton<DashboardRepos>(() => DashboardRepos(getIt()));
  log("✅ DashboardRepos registered");

  getIt.registerFactory<DashboardCubit>(() => DashboardCubit(getIt()));
  log("✅ DashboardCubit registered");
}

Future<void> allcategoriesInit() async {
  getIt.registerLazySingleton<CategoriesRepos>(() => CategoriesRepos(getIt()));
  log("✅ CategoriesRepos registered");

  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt()));
  log("✅ CategoriesCubit registered");
}
