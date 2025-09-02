part of 'categories_cubit.dart';

sealed class CategoriesState {}

final class CategriesInitial extends CategoriesState {}

// create states

final class LoadingCreateCategoryState extends CategoriesState {}

final class SuccessCreateCategoryState extends CategoriesState {}

final class ErrorCreateCategoryState extends CategoriesState {
  final String error;

  ErrorCreateCategoryState({required this.error});
}

// get all category states

final class LoadingGetAllCategoryState extends CategoriesState {}

final class SuccessGetAllCategoryState extends CategoriesState {
  final List<CategoryContent> categoriesList;

  SuccessGetAllCategoryState({required this.categoriesList});
}

final class ErrorGetAllCategoryState extends CategoriesState {
  final String error;

  ErrorGetAllCategoryState({required this.error});
}

// delete category states

final class LoadingDeleteCategoryState extends CategoriesState {}

final class SuccessDeleteCategoryState extends CategoriesState {}

final class ErrorDeleteCategoryState extends CategoriesState {
  final String error;

  ErrorDeleteCategoryState({required this.error});
}

// update category states

final class LoadingUpdateCategoryState extends CategoriesState {}

final class SuccessUpdateCategoryState extends CategoriesState {}

final class ErrorUpdateCategoryState extends CategoriesState {
  final String error;

  ErrorUpdateCategoryState({required this.error});
}
