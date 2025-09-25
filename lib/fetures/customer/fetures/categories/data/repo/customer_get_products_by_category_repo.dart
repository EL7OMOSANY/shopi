import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/core/services/graphql/api_service.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/get_all_products_response.dart';
import 'package:shopi/fetures/customer/fetures/categories/data/graphql/customer_get_products_by_category_mutation.dart';

class CustomerGetProductsByCategoryRepo {
  final ApiService _apiService;

  CustomerGetProductsByCategoryRepo(this._apiService);

  Future<ApiCheckResult<GetAllProductsResponse>> getProductsByCategoryId({
    required int categoryId,
  }) async {
    try {
      final response = await _apiService.getProductsByCategoryId(
        CustomerGetProductsByCategoryMutation().getProductsByCategoryIdMutation(
          categoryId: categoryId,
        ),
      );
      return ApiCheckResult.success(response);
    } catch (error) {
      return ApiCheckResult.failure(error.toString());
    }
  }
}
