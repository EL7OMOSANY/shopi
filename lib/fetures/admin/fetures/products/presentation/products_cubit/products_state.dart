part of 'products_cubit.dart';

sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

// create states

final class LoadingCreateProductState extends ProductsState {}

final class SuccessCreateProductState extends ProductsState {}

final class ErrorCreateProductState extends ProductsState {
  final String error;

  ErrorCreateProductState({required this.error});
}

// get all Product states

final class LoadingGetAllProductState extends ProductsState {}

final class SuccessGetAllProductState extends ProductsState {
  final List<ProductModel> productsList;

  SuccessGetAllProductState({required this.productsList});
}

final class ErrorGetAllProductState extends ProductsState {
  final String error;

  ErrorGetAllProductState({required this.error});
}

// delete Product states

final class LoadingDeleteProductState extends ProductsState {}

final class SuccessDeleteProductState extends ProductsState {}

final class ErrorDeleteProductState extends ProductsState {
  final String error;

  ErrorDeleteProductState({required this.error});
}

// update Product states

final class LoadingUpdateProductState extends ProductsState {}

final class SuccessUpdateProductState extends ProductsState {}

final class ErrorUpdateProductState extends ProductsState {
  final String error;

  ErrorUpdateProductState({required this.error});
}
