// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:shopi/core/constants/shared_pref_keys.dart';
// import 'package:shopi/core/helpers/shared_pref_helper.dart';

// import 'package:shopi/core/langs/lang_keys.dart';
// import 'package:shopi/core/services/graphql/api_check_result.dart';
// import 'package:shopi/core/services/graphql/api_service.dart';
// import 'package:shopi/fetures/auth/login/data/graphql/login_mutation.dart';
// import 'package:shopi/fetures/auth/login/data/models/login_request.dart';
// import 'package:shopi/fetures/auth/login/data/models/login_response.dart';
// import 'package:shopi/fetures/auth/login/data/models/user%20role/models/user_role_response.dart';
// import 'package:shopi/fetures/auth/signup/data/graphql/signup_mutation.dart';
// import 'package:shopi/fetures/auth/signup/data/models/sign_up_request.dart';
// import 'package:shopi/fetures/auth/signup/data/models/signup_response.dart';

// class AuthRepos {
//   // const AuthRepos(this._dataSource);
//   // final AuthDataSource _dataSource;

//   final ApiService _apiService;

//   final Dio _dio = Dio();

//   AuthRepos(this._apiService);

//   //Loign repo
//   Future<ApiCheckResult<LoginResponse>> login(LoginRequest loginRequest) async {
//     try {
//       final response = await _apiService.login(
//         LoginMutation().loginMutation(loginRequest: loginRequest),
//       );
//       return ApiCheckResult.success(response);
//     } catch (error) {
//       log("Login Error: $error");
//       return const ApiCheckResult.failure(LangKeys.loggedError);
//     }
//   }

//   //Get User Role repo
//   Future<UserRoleResponse> userRole(String token) async {
//     _dio.options.headers['Authorization'] = 'Bearer $token';

//     final client = ApiService(_dio);
//     final response = await client.userRole();

//     log("User Role ===> ${response.userRole}");

//     // Save user role and id in shared pref
//     await SharedPref().setString(
//       SharedPrefKeys.userRole,
//       response.userRole ?? '',
//     );

//     return response;
//   }

//   //sign up repo

//   Future<ApiCheckResult<SignupResponse>> signUp({
//     required SignUpRequest signUpRequestBody,
//   }) async {
//     try {
//       final response = await _apiService.signUp(
//         SignupMutation().signUpMutation(signUpRequest: signUpRequestBody),
//       );

//       return ApiCheckResult.success(response);
//     } catch (error) {
//       log("SignUp Error: $error");
//       return const ApiCheckResult.failure(LangKeys.loggedError);
//     }
//   }

//   // // add user id in firebase to used with notfication data base
//   // Future<void> addUserIdFirebase({required String userId}) async {
//   //   await _dataSource.addUserIdFirebase(userId: userId);
//   // }
// }

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/core/services/graphql/api_service.dart';
import 'package:shopi/fetures/auth/login/data/graphql/login_mutation.dart';
import 'package:shopi/fetures/auth/login/data/models/login_request.dart';
import 'package:shopi/fetures/auth/login/data/models/login_response.dart';
import 'package:shopi/fetures/auth/login/data/models/user%20role/models/user_role_response.dart';
import 'package:shopi/fetures/auth/signup/data/graphql/signup_mutation.dart';
import 'package:shopi/fetures/auth/signup/data/models/sign_up_request.dart';
import 'package:shopi/fetures/auth/signup/data/models/signup_response.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/error_create_product_model.dart';

class AuthRepos {
  final ApiService _apiService;
  final Dio _dio = Dio();

  AuthRepos(this._apiService);

  // Login
  Future<ApiCheckResult<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await _apiService.login(
        LoginMutation().loginMutation(loginRequest: loginRequest),
      );

      // ✅ لو فيه errors
      if (response["errors"] != null) {
        final errorModel = ErrorCreateProductModel.fromJson(response);

        final errorMessage =
            errorModel.errors?.first.extensions?.originalError?.message?.join(
              ", ",
            ) ??
            errorModel.errors?.first.message ??
            LangKeys.loggedError;

        log("❌ Login failed: $errorMessage");
        return ApiCheckResult.failure(errorMessage);
      }

      // ✅ لو الداتا موجودة
      if (response["data"] != null) {
        final model = LoginResponse.fromJson(response);
        log("✅ Login success: ${model.data}");
        return ApiCheckResult.success(model);
      }

      return const ApiCheckResult.failure(LangKeys.loggedError);
    } catch (error) {
      log("❌ Exception in login: $error");
      return const ApiCheckResult.failure(LangKeys.loggedError);
    }
  }

  // Get User Role
  Future<UserRoleResponse> userRole(String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';

    final client = ApiService(_dio);
    final response = await client.userRole();

    log("User Role ===> ${response.userRole}");

    await SharedPref().setString(
      SharedPrefKeys.userRole,
      response.userRole ?? '',
    );

    return response;
  }

  //sign up repo

  Future<ApiCheckResult<SignupResponse>> signUp({
    required SignUpRequest signUpRequestBody,
  }) async {
    try {
      final response = await _apiService.signUp(
        SignupMutation().signUpMutation(signUpRequest: signUpRequestBody),
      );

      return ApiCheckResult.success(response);
    } catch (error) {
      log("SignUp Error: $error");
      return const ApiCheckResult.failure(LangKeys.loggedError);
    }
  }
}
