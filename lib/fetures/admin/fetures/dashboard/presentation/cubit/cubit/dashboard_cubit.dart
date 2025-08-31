import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/data/repo/dashboard_repos.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/presentation/cubit/cubit/dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(this._dashboardRepos) : super(DashboardInitial());
  final DashboardRepos _dashboardRepos;

  // get users numbers
  Future<void> getProductsNums() async {
    emit(ProductsLoading());
    final result = await _dashboardRepos.getProductsNumber();
    result.when(
      success: (response) {
        emit(ProductsLoaded(products: response.productsNumbers));
      },
      failure: (error) {
        log("Error in dashboard Cubit is : $error");
        emit(ProductsFailure(message: error));
      },
    );
  }

  // get categories numbers
  Future<void> getCategoriesNums() async {
    emit(CategoriesLoading());
    final result = await _dashboardRepos.getCategoriesNumber();
    result.when(
      success: (response) {
        emit(CategoriesLoaded(categories: response.categoryNumbers));
      },
      failure: (error) {
        log("Error in dashboard Cubit is : $error");
        emit(CategoriesFailure(message: error));
      },
    );
  }

  // get users numbers
  Future<void> getUsersNums() async {
    emit(UsersLoading());
    final result = await _dashboardRepos.getUsersNumber();
    result.when(
      success: (response) {
        emit(UsersLoaded(users: response.usersNumbers));
      },
      failure: (error) {
        log("Error in dashboard Cubit is : $error");
        emit(UsersFailure(message: error));
      },
    );
  }
}
