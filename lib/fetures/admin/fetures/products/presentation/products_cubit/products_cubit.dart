import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/create_product_request.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/delete_product.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/get_all_products_response.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/update_product_request.dart';
import 'package:shopi/fetures/admin/fetures/products/data/repo/products_repos.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._productsRepos) : super(ProductsInitial());

  final ProductsRepos _productsRepos;

  List<ProductModel> productsList = [];

  //get all categories
  Future<void> getAllProducts() async {
    emit(LoadingGetAllProductState());

    try {
      final result = await _productsRepos.getAllProducts();
      result.when(
        success: (response) {
          if (response.productGetAllList.isEmpty) {
            log("getAllproductsList is empty");
            emit(SuccessGetAllProductState(productsList: productsList));
          } else {
            productsList = response.productGetAllList;
            log("getAllproductsList is not empty");

            emit(SuccessGetAllProductState(productsList: productsList));
          }
        },
        failure: (error) {
          log("Error in getAllCategories Cubit is : $error");
          emit(ErrorGetAllProductState(error: error));
        },
      );
    } catch (error) {
      log("Error in getAllCategories Cubit is : $error");
      emit(ErrorGetAllProductState(error: error.toString()));
    }
  }

  //create Product
  Future<void> createProduct({
    final String? title,
    final double? price,
    final List<String>? imageList,
    final String? description,
    final double? categoryId,
  }) async {
    emit(LoadingCreateProductState());
    try {
      // ✨ تنظيف الليست من القيم الفاضية
      final cleanedImages =
          imageList?.where((img) => img.trim().isNotEmpty).toList() ?? [];

      log("🖼 Final Images to send: $cleanedImages");

      final result = await _productsRepos.createProduct(
        createProductRequest: CreateProductRequest(
          title: title ?? "",
          price: price ?? 0,
          images: cleanedImages,
          description: description ?? "",
          categoryId: categoryId ?? 1.0,
        ),
      );

      result.when(
        success: (response) {
          log("✅ Raw createProduct response: ${response.toJson()}");

          // بنشيك لو فيه data أو لأ
          if (response.data == null || response.data?.product == null) {
            log("❌ createProduct failed: response.data is null");
            emit(
              ErrorCreateProductState(error: "Unknown error in createProduct"),
            );
          } else {
            log("✅ createProduct success: ${response.data?.product?.toJson()}");
            emit(SuccessCreateProductState());
          }
        },
        failure: (error) {
          log("❌ Error in createProduct Cubit is : $error");
          emit(ErrorCreateProductState(error: error));
        },
      );
    } catch (error) {
      log("❌ Exception in createProduct Cubit is : $error");
      emit(ErrorCreateProductState(error: error.toString()));
    }
  }

  //delete Product
  Future<void> deleteProduct(DeleteProduct deleteProduct) async {
    emit(LoadingDeleteProductState());
    try {
      final result = await _productsRepos.deleteProduct(
        deleteProduct: DeleteProduct(id: deleteProduct.id),
      );
      result.when(
        success: (response) {
          emit(SuccessDeleteProductState());
        },
        failure: (error) {
          log("Error in deleteProduct Cubit is : $error");
          emit(ErrorDeleteProductState(error: error));
        },
      );
    } catch (error) {
      log("Error in deleteProduct Cubit is : $error");
      emit(ErrorDeleteProductState(error: error.toString()));
    }
  }

  //update Product
  Future<void> updateProduct(UpdateProductRequest updateProductRequest) async {
    emit(LoadingUpdateProductState());
    try {
      final result = await _productsRepos.updateProduct(
        updateProductRequest: updateProductRequest,
      );
      result.when(
        success: (response) {
          log("Success in updateProduct Cubit");
          emit(SuccessUpdateProductState());
        },
        failure: (error) {
          log("Error in updateProduct Cubit is : $error");
          emit(ErrorUpdateProductState(error: error));
        },
      );
    } catch (error) {
      log("Error in updateProduct Cubit is : $error");
      emit(ErrorUpdateProductState(error: error.toString()));
    }
  }
}
