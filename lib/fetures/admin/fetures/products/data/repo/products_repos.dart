import 'dart:developer';

import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/core/services/graphql/api_service.dart';
import 'package:shopi/fetures/admin/fetures/products/data/graphql/product_mutation.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/create_product_request.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/create_product_response.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/delete_product.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/error_create_product_model.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/get_all_products_response.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/update_product_request.dart';

class ProductsRepos {
  final ApiService _apiService;

  ProductsRepos(this._apiService);

  //get all products
  Future<ApiCheckResult<GetAllProductsResponse>> getAllProducts() async {
    try {
      final response = await _apiService.getAllProduct(
        ProductsMutations().getAllProductsMutation(),
      );

      if (response.data.products.isEmpty) {
        log("there is no products in getAllproducts repo");
        return ApiCheckResult.failure("there is no products");
      } else {
        return ApiCheckResult.success(response);
      }
    } catch (error) {
      return ApiCheckResult.failure(error.toString());
    }
  }

  //update products
  Future<ApiCheckResult<void>> updateProduct({
    required UpdateProductRequest updateProductRequest,
  }) async {
    try {
      final response = await _apiService.updateProduct(
        ProductsMutations().updateProductMap(
          updateProductRequest: updateProductRequest,
        ),
      );
      return ApiCheckResult.success(response);
    } catch (error) {
      return ApiCheckResult.failure(error.toString());
    }
  }

  //delete product
  Future<ApiCheckResult<void>> deleteProduct({
    required DeleteProduct deleteProduct,
  }) async {
    try {
      final response = await _apiService.deleteProduct(
        ProductsMutations().deleteMutation(deleteProduct: deleteProduct),
      );
      return ApiCheckResult.success(response);
    } catch (error) {
      return ApiCheckResult.failure(error.toString());
    }
  }

  Future<ApiCheckResult<dynamic>> createProduct({
    required CreateProductRequest createProductRequest,
  }) async {
    try {
      final response = await _apiService.createProduct(
        ProductsMutations().createProductMutation(
          createProductRequest: createProductRequest,
        ),
      );

      // Debug
      log("✅ Raw createProduct response: $response");

      // ✅ لو فيه errors
      if (response["errors"] != null) {
        final errorModel = ErrorCreateProductModel.fromJson(response);

        final errorMessage =
            errorModel.errors?.first.extensions?.originalError?.message?.join(
              ", ",
            ) ??
            errorModel.errors?.first.message ??
            "Unknown error";

        log("❌ createProduct failed: $errorMessage");

        return ApiCheckResult.failure(errorMessage);
      }

      // ✅ لو الداتا موجودة
      if (response["data"] != null) {
        final model = CreateProductResponse.fromJson(response);
        log("✅ createProduct success: ${model.data}");
        return ApiCheckResult.success(model);
      }

      // fallback
      return ApiCheckResult.failure("Unknown response format");
    } catch (error) {
      log("❌ Exception in createProduct: $error");
      return ApiCheckResult.failure(error.toString());
    }
  }
}
