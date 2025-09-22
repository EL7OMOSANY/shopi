part of 'customer_home_cubit.dart';

sealed class CustomerHomeState {}

final class CustomerHomeInitial extends CustomerHomeState {}

// banners states

final class CustomerHomeBannersLoading extends CustomerHomeState {}

final class CustomerHomeBannersSuccess extends CustomerHomeState {
  CustomerHomeBannersSuccess(this.bannersImageList);

  final List<String> bannersImageList;
}

final class CustomerHomeBannersFailure extends CustomerHomeState {
  CustomerHomeBannersFailure(this.errorMessage);

  final String errorMessage;
}

// products states

final class CustomerHomeProductsLoading extends CustomerHomeState {}

final class CustomerHomeProductsSuccess extends CustomerHomeState {}

final class CustomerHomeProductsFailure extends CustomerHomeState {
  CustomerHomeProductsFailure(this.errorMessage);

  final String errorMessage;
}

// categories states

final class CustomerHomeCategoriesLoading extends CustomerHomeState {}

final class CustomerHomeCategoriesSuccess extends CustomerHomeState {}

final class CustomerHomeCategoriesFailure extends CustomerHomeState {
  CustomerHomeCategoriesFailure(this.errorMessage);

  final String errorMessage;
}
