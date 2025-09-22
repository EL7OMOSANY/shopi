import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/core/services/graphql/api_service.dart';
import 'package:shopi/fetures/customer/fetures/home/data/graphql/customer_home_mutation.dart';
import 'package:shopi/fetures/customer/fetures/home/data/models/banners_response.dart';

class CustomerHomeRepos {
  final ApiService _apiService;

  CustomerHomeRepos(this._apiService);

  Future<ApiCheckResult<BannersResponse>> getBanners() async {
    try {
      final response = await _apiService.getBanners(
        CustomerHomeMutation().getBannersMutation(),
      );
      return ApiCheckResult.success(response);
    } catch (error) {
      return ApiCheckResult.failure(error.toString());
    }
  }
}
