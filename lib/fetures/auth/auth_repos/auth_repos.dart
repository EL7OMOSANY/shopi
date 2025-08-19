import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/core/services/graphql/api_service.dart';
import 'package:shopi/fetures/auth/login/data/graphql/login_mutation.dart';
import 'package:shopi/fetures/auth/login/data/models/login_request.dart';
import 'package:shopi/fetures/auth/login/data/models/login_response.dart';
import 'package:shopi/fetures/auth/login/data/models/user%20role/models/user_role_response.dart';

class AuthRepos {
  // const AuthRepos(this._dataSource);
  // final AuthDataSource _dataSource;

  final ApiService _apiService;

  final Dio _dio = Dio();

  AuthRepos(this._apiService);

  //Loign
  Future<ApiCheckResult<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await _apiService.login(
        LoginMutation().loginMutation(loginRequest: loginRequest),
      );
      return ApiCheckResult.success(response);
    } catch (error) {
      log("Login Error: $error");
      return const ApiCheckResult.failure(LangKeys.loggedError);
    }
  }

  //Get User Role
  Future<UserRoleResponse> userRole(String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';

    final client = ApiService(_dio);
    final response = await client.userRole();

    log("User Role ===> ${response.userRole}");

    return response;
  }

  // //SignUp
  // Future<ApiResult<SignUpResponse>> signUp(SignUpRequestBody body) async {
  //   try {
  //     final response = await _dataSource.signUp(body: body);

  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return const ApiResult.failure('Please, try agian we have error');
  //   }
  // }

  // // add user id in firebase to used with notfication data base
  // Future<void> addUserIdFirebase({required String userId}) async {
  //   await _dataSource.addUserIdFirebase(userId: userId);
  // }
}
