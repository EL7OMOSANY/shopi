part of 'products_by_category_id_cubit.dart';

sealed class ProductsByCategoryIdState {}

final class ProductsByCategoryIdInitial extends ProductsByCategoryIdState {}

final class LoadingGetProductsByCategoryIdState
    extends ProductsByCategoryIdState {}

final class SuccessGetProductsByCategoryIdState
    extends ProductsByCategoryIdState {
  List<ProductModel> productsList;

  SuccessGetProductsByCategoryIdState(this.productsList);
}

final class ErrorGetProductsByCategoryIdState
    extends ProductsByCategoryIdState {
  final String errorMessage;

  ErrorGetProductsByCategoryIdState(this.errorMessage);
}
