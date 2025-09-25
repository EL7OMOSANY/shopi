import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/get_all_products_response.dart';
import 'package:shopi/fetures/customer/fetures/search/data/models/customer_search_request_body.dart';
import 'package:shopi/fetures/customer/fetures/search/data/repo/customer_search_repo.dart';

part 'customer_search_state.dart';

class CustomerSearchCubit extends Cubit<CustomerSearchState> {
  CustomerSearchCubit(this._repo) : super(CustomerSearchInitial());

  final CustomerSearchRepo _repo;
  List<ProductModel> productList = [];

  Future<void> searchProduct({required CustomerSearchRequestBody body}) async {
    try {
      final result = await _repo.searchProduct(body: body);
      result.when(
        success: (data) {
          productList = data.productGetAllList;
          emit(CustomerSearchSuccess(productList));
        },
        failure: (error) {
          emit(CustomerSearchFailure(error));
        },
      );
    } catch (error) {
      emit(CustomerSearchFailure(error.toString()));
    }
  }
}
