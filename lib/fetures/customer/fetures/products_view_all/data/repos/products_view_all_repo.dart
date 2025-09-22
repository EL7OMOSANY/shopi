import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/core/services/graphql/api_service.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/get_all_products_response.dart';
import 'package:shopi/fetures/customer/fetures/products_view_all/data/graphql/customer_view_all_products_mutation.dart';

class ProductsViewAllRepo {
  final ApiService _apiService;

  ProductsViewAllRepo(this._apiService);

  Future<ApiCheckResult<GetAllProductsResponse>> viewAllProducts({
    required int offset,
  }) async {
    try {
      final response = await _apiService.getProductsViewAll(
        CustomerViewAllProductsMutation().viewAllProductsMutation(
          offset: offset,
        ),
      );
      return ApiCheckResult.success(response);
    } catch (error) {
      return ApiCheckResult.failure(error.toString());
    }
  }
}
