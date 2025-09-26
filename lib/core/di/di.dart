import 'dart:developer';
import 'package:app_links/app_links.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shopi/core/app/app_cubit/app_cubit.dart';
import 'package:shopi/core/app/share_cubit/share_cubit.dart';
import 'package:shopi/core/app/upload_image_cubit/repo/upload_image_repo.dart';
import 'package:shopi/core/app/upload_image_cubit/upload_image_cubit.dart';
import 'package:shopi/core/services/dynamic_links/dynamic_links_services.dart';
import 'package:shopi/core/services/graphql/api_service.dart';
import 'package:shopi/fetures/admin/fetures/category/data/repo/categories_repos.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/data/repo/dashboard_repos.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/presentation/cubit/cubit/dashboard_cubit.dart';
import 'package:shopi/fetures/admin/fetures/notifications/data/repos/notifaction_repos.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/notification_cubit/cubit/notification_cubit.dart';
import 'package:shopi/fetures/admin/fetures/products/data/repo/products_repos.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/products_cubit/products_cubit.dart';
import 'package:shopi/fetures/admin/fetures/users/data/repo/users_repos.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/users_cubit/cubit/users_cubit.dart';
import 'package:shopi/fetures/auth/auth_repos/auth_repos.dart';
import 'package:shopi/fetures/auth/login/presentaion/login_cubit/login_cubit.dart';
import 'package:shopi/fetures/auth/signup/presentation/logic/cubit/signup_cubit.dart';
import 'package:shopi/fetures/customer/fetures/categories/data/repo/customer_get_products_by_category_repo.dart';
import 'package:shopi/fetures/customer/fetures/categories/presentation/cubit/products_by_category_id_cubit.dart';
import 'package:shopi/fetures/customer/fetures/favorits/presentation/cubit/customer_favorites_cubit.dart';
import 'package:shopi/fetures/customer/fetures/home/data/repo/banners_repo.dart';
import 'package:shopi/fetures/customer/fetures/home/presentation/cubit/cubit/customer_home_cubit.dart';
import 'package:shopi/fetures/customer/fetures/product_details/data/repos/customer_product_details_repo.dart';
import 'package:shopi/fetures/customer/fetures/product_details/presentation/cubit/customer_product_details_cubit.dart';
import 'package:shopi/fetures/customer/fetures/products_view_all/data/repos/products_view_all_repo.dart';
import 'package:shopi/fetures/customer/fetures/profile/presentation/cubit/cubit/customer_profile_cubit.dart';
import 'package:shopi/fetures/customer/fetures/search/data/repo/customer_search_repo.dart';
import 'package:shopi/fetures/customer/fetures/search/presentation/cubit/customer_search_cubit.dart';
import 'package:shopi/fetures/customer/main/presentation/main%20cubit/cubit/main_cubit.dart';

final GetIt getIt = GetIt.instance;
GetIt get getItInstance => getIt;
final navigatorKey = GlobalKey<NavigatorState>();

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

  allProductsInit();

  allUsersInit();

  notificationsInit();

  customerInit();

  customerHomeInit();
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

  getIt.registerSingleton<GlobalKey<NavigatorState>>(navigatorKey);
  log("✅ GlobalKey<NavigatorState> registered");

  getIt.registerFactory<UploadImageCubit>(() => UploadImageCubit(getIt()));

  log("✅ UploadImageCubit registered");

  getIt.registerLazySingleton<UploadImageRepo>(() => UploadImageRepo(getIt()));

  log("✅ UploadImageRepo registered");

  // ✅ سجل AppLinks قبل ما تستعمله في DeepLinkService
  getIt.registerSingleton<AppLinks>(AppLinks());
  log("✅ AppLinks registered");

  getIt.registerSingleton<DeepLinkService>(DeepLinkService(getIt<AppLinks>()));
  log("✅ DeepLinkService registered as singleton");
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

Future<void> allProductsInit() async {
  getIt.registerLazySingleton<ProductsRepos>(() => ProductsRepos(getIt()));
  log("✅ ProductsRepos registered");

  getIt.registerFactory<ProductsCubit>(() => ProductsCubit(getIt()));
  log("✅ ProductsCubit registered");
}

Future<void> allUsersInit() async {
  getIt.registerLazySingleton<UsersRepos>(() => UsersRepos(getIt()));
  log("✅ UsersRepos registered");

  getIt.registerFactory<UsersCubit>(() => UsersCubit(getIt()));
  log("✅ UsersCubit registered");
}

Future<void> notificationsInit() async {
  getIt.registerLazySingleton<NotifactionRepos>(() => NotifactionRepos());
  log("✅ NotifactionRepos registered");

  getIt.registerFactory<NotificationCubit>(() => NotificationCubit(getIt()));
  log("✅ NotificationCubit registered");
}

Future<void> customerInit() async {
  getIt.registerFactory<MainCubit>(() => MainCubit());
  log("✅ MainCubit registered");

  getIt.registerFactory<CustomerProfileCubit>(
    () => CustomerProfileCubit(getIt()),
  );
  log("✅ CustomerProfileCubit registered");
}

// customer home init

Future<void> customerHomeInit() async {
  getIt.registerFactory<CustomerHomeRepos>(() => CustomerHomeRepos(getIt()));
  log("✅ CustomerHomeRepos registered");

  getIt.registerFactory<CustomerHomeCubit>(() => CustomerHomeCubit(getIt()));
  log("✅ CustomerHomeCubit registered");

  getIt.registerFactory<ProductsViewAllRepo>(
    () => ProductsViewAllRepo(getIt()),
  );
  log("✅ ProductsViewAllRepo registered");

  getIt.registerFactory<CustomerProductDetailsRepo>(
    () => CustomerProductDetailsRepo(getIt()),
  );
  log("✅ CustomerProductDetailsRepo registered");

  getIt.registerFactory<CustomerProductDetailsCubit>(
    () => CustomerProductDetailsCubit(getIt()),
  );
  log("✅ CustomerProductDetailsCubit registered");

  getIt.registerFactory<ProductsByCategoryIdCubit>(
    () => ProductsByCategoryIdCubit(getIt()),
  );
  log("✅ ProductsByCategoryIdCubit registered");

  getIt.registerFactory<CustomerGetProductsByCategoryRepo>(
    () => CustomerGetProductsByCategoryRepo(getIt()),
  );
  log("✅ CustomerGetProductsByCategoryRepo registered");
  //CustomerSearchRepo

  getIt.registerFactory<CustomerSearchCubit>(
    () => CustomerSearchCubit(getIt()),
  );
  log("✅ CustomerSearchCubit registered");

  getIt.registerFactory<CustomerSearchRepo>(() => CustomerSearchRepo(getIt()));
  log("✅ CustomerSearchRepo registered");

  getIt.registerFactory<CustomerFavoritesCubit>(() => CustomerFavoritesCubit());
  log("✅ CustomerFavoritesCubit registered");
  getIt.registerFactory<ShareCubit>(() => ShareCubit());
  log("✅ ShareCubit registered");
}
