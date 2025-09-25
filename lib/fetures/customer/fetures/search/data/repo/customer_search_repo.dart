import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/core/services/graphql/api_service.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/get_all_products_response.dart';
import 'package:shopi/fetures/customer/fetures/search/data/graphql/customer_search_mutation.dart';
import 'package:shopi/fetures/customer/fetures/search/data/models/customer_search_request_body.dart';

class CustomerSearchRepo {
  const CustomerSearchRepo(this._apiService);

  final ApiService _apiService;
  // Search for product
  Future<ApiCheckResult<GetAllProductsResponse>> searchProduct({
    required CustomerSearchRequestBody body,
  }) async {
    try {
      final response = await _apiService.searchProduct(
        CustomerSearchMutation().searchProduct(
          body: CustomerSearchRequestBody(
            searchName: body.searchName,
            priceMin: body.priceMin,
            priceMax: body.priceMax,
          ),
        ),
      );
      return ApiCheckResult.success(response);
    } catch (e) {
      return const ApiCheckResult.failure('Something went wrong');
    }
  }
}
