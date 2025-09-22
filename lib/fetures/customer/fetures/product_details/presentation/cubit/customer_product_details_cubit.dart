import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/fetures/customer/fetures/product_details/data/models/product_details_reponse.dart';
import 'package:shopi/fetures/customer/fetures/product_details/data/repos/customer_product_details_repo.dart';

part 'customer_product_details_state.dart';

class CustomerProductDetailsCubit extends Cubit<CustomerProductDetailsState> {
  CustomerProductDetailsCubit(this._repo)
    : super(CustomerProductDetailsInitial());

  final CustomerProductDetailsRepo _repo;

  ProductDetailsModel productDetailsModel = ProductDetailsModel(
    'productName',
    0.0,
    [],
    'description',
    CategoryDateilaModel('categoryName'),
    "0",
  );

  Future<void> productDetails({required int id}) async {
    try {
      emit(CustomerProductDetailsLoading());
      final result = await _repo.productDetails(id: id);
      result.when(
        success: (data) {
          productDetailsModel = data.data.productModel;
          emit(CustomerProductDetailsSuccess(data.data.productModel));
        },
        failure: (error) {
          emit(CustomerProductDetailsFailure(error));
        },
      );
    } catch (error) {
      emit(CustomerProductDetailsFailure(error.toString()));
    }
  }
}
