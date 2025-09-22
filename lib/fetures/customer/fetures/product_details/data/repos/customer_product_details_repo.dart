import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/core/services/graphql/api_service.dart';
import 'package:shopi/fetures/customer/fetures/product_details/data/graphql/customer_product_details_mutation.dart';
import 'package:shopi/fetures/customer/fetures/product_details/data/models/product_details_reponse.dart';

class CustomerProductDetailsRepo {
  final ApiService _apiService;

  CustomerProductDetailsRepo(this._apiService);

  Future<ApiCheckResult<CustomerProductDetailsResponse>> productDetails({
    required int id,
  }) async {
    try {
      final response = await _apiService.productDetails(
        CustomerProductDetailsMutation().getProductDetailsMutation(id: id),
      );
      return ApiCheckResult.success(response);
    } catch (error) {
      return ApiCheckResult.failure(error.toString());
    }
  }
}
