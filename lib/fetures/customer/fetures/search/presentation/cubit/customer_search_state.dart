part of 'customer_search_cubit.dart';

sealed class CustomerSearchState {}

final class CustomerSearchInitial extends CustomerSearchState {}

final class CustomerSearchLoading extends CustomerSearchState {}

final class CustomerSearchSuccess extends CustomerSearchState {
  List<ProductModel> productList;
  CustomerSearchSuccess(this.productList);
}

final class CustomerSearchFailure extends CustomerSearchState {
  final String errorMessage;

  CustomerSearchFailure(this.errorMessage);
}

final class CustomerSearchEmpty extends CustomerSearchState {}
