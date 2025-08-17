import 'package:shopi/core/services/graphql/api_service.dart';
import 'package:shopi/fetures/auth/login/data/models/login_request.dart';
import 'package:shopi/fetures/auth/login/data/models/login_response.dart';
import 'package:shopi/fetures/auth/login/data/graphql/login_mutation.dart';

class LoginDataSource {
  final ApiService _apiService;

  LoginDataSource(this._apiService);

  Future<LoginResponse> loginDataSource({
    required LoginRequest loginRequest,
  }) async {
    final response = await _apiService.login(
      LoginMutation().loginMutation(loginRequest: loginRequest),
    );

    return response;
  }
}
