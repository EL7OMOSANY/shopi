import 'dart:developer';
import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/core/services/graphql/api_service.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/data/models/category_nums_response.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/data/models/products_nums_response.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/data/models/users_nums_response.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/data/graphql/dashboard_mutation.dart';

class DashboardRepos {
  final ApiService _apiService;

  DashboardRepos(this._apiService);

  // get users number
  Future<ApiCheckResult<UsersNumsResponse>> getUsersNumber() async {
    try {
      final response = await _apiService.numberOfUsers(
        DashBoardMutations().numberOfUsersMutation(),
      );
      return ApiCheckResult.success(response);
    } catch (error) {
      log("Error in dashboard repo is : $error");
      return ApiCheckResult.failure(error.toString());
    }
  }

  // get categories number
  Future<ApiCheckResult<CategoryNumsResponse>> getCategoriesNumber() async {
    try {
      final response = await _apiService.numberOfCategories(
        DashBoardMutations().numberOfCategoriesMutation(),
      );
      return ApiCheckResult.success(response);
    } catch (error) {
      log("Error in dashboard repo is : $error");
      return ApiCheckResult.failure(error.toString());
    }
  }

  // get products number
  Future<ApiCheckResult<ProductsNumsResponse>> getProductsNumber() async {
    try {
      final response = await _apiService.numberOfProducts(
        DashBoardMutations().numberOfProductsMutation(),
      );
      return ApiCheckResult.success(response);
    } catch (error) {
      log("Error in dashboard repo is : $error");
      return ApiCheckResult.failure(error.toString());
    }
  }
}
