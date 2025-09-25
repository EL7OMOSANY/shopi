import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/get_all_products_response.dart';
import 'package:shopi/fetures/customer/fetures/categories/data/repo/customer_get_products_by_category_repo.dart';

part 'products_by_category_id_state.dart';

class ProductsByCategoryIdCubit extends Cubit<ProductsByCategoryIdState> {
  ProductsByCategoryIdCubit(this._repo) : super(ProductsByCategoryIdInitial());
  List<ProductModel> productsList = [];
  final CustomerGetProductsByCategoryRepo _repo;

  Future<void> getProductsByCategoryId({required int categoryId}) async {
    try {
      emit(LoadingGetProductsByCategoryIdState());
      final result = await _repo.getProductsByCategoryId(
        categoryId: categoryId,
      );
      result.when(
        success: (data) {
          productsList = data.productGetAllList;
          emit(SuccessGetProductsByCategoryIdState(productsList));
        },
        failure: (error) {
          emit(ErrorGetProductsByCategoryIdState(error));
        },
      );
    } catch (error) {
      emit(ErrorGetProductsByCategoryIdState(error.toString()));
    }
  }
}
