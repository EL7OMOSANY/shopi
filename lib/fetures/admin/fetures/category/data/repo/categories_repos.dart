import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/core/services/graphql/api_service.dart';
import 'package:shopi/fetures/admin/fetures/category/data/graphql/categories_mutations.dart';
import 'package:shopi/fetures/admin/fetures/category/data/models/create_category_request.dart';
import 'package:shopi/fetures/admin/fetures/category/data/models/create_category_response.dart';
import 'package:shopi/fetures/admin/fetures/category/data/models/delete_category.dart';
import 'package:shopi/fetures/admin/fetures/category/data/models/get_all_categories_response.dart';
import 'package:shopi/fetures/admin/fetures/category/data/models/update_category_request.dart';

class CategoriesRepos {
  final ApiService _apiService;
  CategoriesRepos(this._apiService);

  //create category
  Future<ApiCheckResult<CreateCategoryResponse>> createCategory({
    required CreateCategoryRequest createCategoryRequest,
  }) async {
    try {
      final response = await _apiService.createCategory(
        CategoriesMutations().createMutation(
          createCategoryRequest: createCategoryRequest,
        ),
      );
      return ApiCheckResult.success(response);
    } catch (error) {
      return ApiCheckResult.failure(error.toString());
    }
  }

  //get all categories
  Future<ApiCheckResult<GetAllCategoriesResponse>> getAllCategories() async {
    try {
      final response = await _apiService.getAllCategories(
        CategoriesMutations().getAllCategoriesMutation(),
      );
      return ApiCheckResult.success(response);
    } catch (error) {
      return ApiCheckResult.failure(error.toString());
    }
  }

  //delete category
  Future<ApiCheckResult<void>> deleteCategory({
    required DeleteCategoryRequest deleteCategoryRequest,
  }) async {
    try {
      final response = await _apiService.deleteCategory(
        CategoriesMutations().deleteMutation(
          deleteCategoryRequest: deleteCategoryRequest,
        ),
      );
      return ApiCheckResult.success(response);
    } catch (error) {
      return ApiCheckResult.failure(error.toString());
    }
  }

  //update category
  Future<ApiCheckResult<void>> updateCategory({
    required UpdateCategoryRequest updateCategoryRequest,
  }) async {
    try {
      final response = await _apiService.updateCategory(
        CategoriesMutations().updateMutation(
          updateCategoryRequest: updateCategoryRequest,
        ),
      );
      return ApiCheckResult.success(response);
    } catch (error) {
      return ApiCheckResult.failure(error.toString());
    }
  }
}
