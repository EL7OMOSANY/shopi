part of 'customer_product_details_cubit.dart';

sealed class CustomerProductDetailsState {}

final class CustomerProductDetailsInitial extends CustomerProductDetailsState {}

final class CustomerProductDetailsLoading extends CustomerProductDetailsState {}

final class CustomerProductDetailsSuccess extends CustomerProductDetailsState {
  CustomerProductDetailsSuccess(this.productDetailsModel);

  final ProductDetailsModel productDetailsModel;
}

final class CustomerProductDetailsFailure extends CustomerProductDetailsState {
  CustomerProductDetailsFailure(this.error);

  final String error;
}
