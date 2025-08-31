abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class ProductsLoading extends DashboardState {}

class ProductsLoaded extends DashboardState {
  final String products;
  ProductsLoaded({required this.products});
}

class ProductsFailure extends DashboardState {
  final String message;
  ProductsFailure({required this.message});
}

class CategoriesLoading extends DashboardState {}

class CategoriesLoaded extends DashboardState {
  final String categories;
  CategoriesLoaded({required this.categories});
}

class CategoriesFailure extends DashboardState {
  final String message;
  CategoriesFailure({required this.message});
}

class UsersLoading extends DashboardState {}

class UsersLoaded extends DashboardState {
  final String users;
  UsersLoaded({required this.users});
}

class UsersFailure extends DashboardState {
  final String message;
  UsersFailure({required this.message});
}
