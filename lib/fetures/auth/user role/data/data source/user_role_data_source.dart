import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shopi/core/services/graphql/api_service.dart';
import 'package:shopi/fetures/auth/user%20role/data/models/user_role_response.dart';

class UserRoleDataSource {
  Future<UserRoleResponse> userRoleDataSource(String token) async {
    final dio = Dio();

    dio.options.headers['Authorization'] = 'Bearer $token';

    final client = ApiService(dio);

    final response = await client.userRole();
    log("User Role ===> ${response.userRole}");
    return response;
  }
}
