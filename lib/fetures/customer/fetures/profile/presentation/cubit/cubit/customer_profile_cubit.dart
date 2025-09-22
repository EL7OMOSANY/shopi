import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';
import 'package:shopi/fetures/auth/auth_repos/auth_repos.dart';
import 'package:shopi/fetures/auth/login/data/models/user%20role/models/user_role_response.dart';

part 'customer_profile_state.dart';

class CustomerProfileCubit extends Cubit<CustomerProfileState> {
  CustomerProfileCubit(this._repo) : super(CustomerProfileInitial());

  final AuthRepos _repo;

  UserRoleResponse userinfo = UserRoleResponse(
    'customer',
    0,
    'User@gmail.com',
    'User',
    "assets/images/core/def_user.png",
  );

  Future<void> getUserInfo() async {
    emit(CustomerProfileLoading());
    try {
      final token = SharedPref().getString(SharedPrefKeys.accessToken) ?? '';
      final response = await _repo.userRole(token);

      userinfo = response;
      emit(CustomerProfileSuccess(userinfo: response));
    } catch (error) {
      log("❌ Get user info error: $error");
      emit(CustomerProfileError(error: error.toString()));
    }
  }
}
