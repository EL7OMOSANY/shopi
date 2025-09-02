import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/fetures/admin/fetures/category/data/models/create_category_request.dart';
import 'package:shopi/fetures/admin/fetures/category/data/models/delete_category.dart';
import 'package:shopi/fetures/admin/fetures/category/data/models/get_all_categories_response.dart';
import 'package:shopi/fetures/admin/fetures/category/data/models/update_category_request.dart';
import 'package:shopi/fetures/admin/fetures/category/data/repo/categories_repos.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._categoriesRepos) : super(CategriesInitial());

  final CategoriesRepos _categoriesRepos;

  List<CategoryContent> categoriesList = [];

  //get all categories
  Future<void> getAllCategories() async {
    emit(LoadingGetAllCategoryState());

    try {
      final result = await _categoriesRepos.getAllCategories();
      result.when(
        success: (response) {
          if (response.getAllCategoriesList.isEmpty) {
            log("getAllCategoriesList is empty");
            emit(SuccessGetAllCategoryState(categoriesList: categoriesList));
          } else {
            categoriesList = response.getAllCategoriesList;
            log("getAllCategoriesList is not empty");

            emit(SuccessGetAllCategoryState(categoriesList: categoriesList));
          }
        },
        failure: (error) {
          log("Error in getAllCategories Cubit is : $error");
          emit(ErrorGetAllCategoryState(error: error));
        },
      );
    } catch (error) {
      log("Error in getAllCategories Cubit is : $error");
      emit(ErrorGetAllCategoryState(error: error.toString()));
    }
  }

  //create category
  Future<void> createCategory({
    required String image,
    required String name,
  }) async {
    emit(LoadingCreateCategoryState());
    try {
      final result = await _categoriesRepos.createCategory(
        createCategoryRequest: CreateCategoryRequest(name: name, image: image),
      );
      result.when(
        success: (response) {
          emit(SuccessCreateCategoryState());
        },
        failure: (error) {
          log("Error in createCategory Cubit is : $error");
          emit(ErrorCreateCategoryState(error: error));
        },
      );
    } catch (error) {
      log("Error in createCategory Cubit is : $error");
      emit(ErrorCreateCategoryState(error: error.toString()));
    }
  }

  //delete category
  Future<void> deleteCategory(
    DeleteCategoryRequest deleteCategoryRequest,
  ) async {
    emit(LoadingDeleteCategoryState());
    try {
      final result = await _categoriesRepos.deleteCategory(
        deleteCategoryRequest: deleteCategoryRequest,
      );
      result.when(
        success: (response) {
          emit(SuccessDeleteCategoryState());
        },
        failure: (error) {
          log("Error in deleteCategory Cubit is : $error");
          emit(ErrorDeleteCategoryState(error: error));
        },
      );
    } catch (error) {
      log("Error in deleteCategory Cubit is : $error");
      emit(ErrorDeleteCategoryState(error: error.toString()));
    }
  }

  //update category
  Future<void> updateCategory(
    UpdateCategoryRequest updateCategoryRequest,
  ) async {
    emit(LoadingUpdateCategoryState());
    try {
      final result = await _categoriesRepos.updateCategory(
        updateCategoryRequest: updateCategoryRequest,
      );
      result.when(
        success: (response) {
          log("Success in updateCategory Cubit");
          emit(SuccessUpdateCategoryState());
        },
        failure: (error) {
          log("Error in updateCategory Cubit is : $error");
          emit(ErrorUpdateCategoryState(error: error));
        },
      );
    } catch (error) {
      log("Error in updateCategory Cubit is : $error");
      emit(ErrorUpdateCategoryState(error: error.toString()));
    }
  }
}
