import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/fetures/auth/login/data/data_source/login_data_source.dart';
import 'package:shopi/fetures/auth/login/data/models/login_request.dart';
import 'package:shopi/fetures/auth/login/data/models/login_response.dart';

class LoginRepository {
  final LoginDataSource _dataSource;

  LoginRepository(this._dataSource);

  //Loign
  Future<ApiCheckResult<LoginResponse>> loginRepo(
    LoginRequest loginRequest,
  ) async {
    try {
      final response = await _dataSource.loginDataSource(
        loginRequest: loginRequest,
      );

      return ApiCheckResult.success(response);
    } catch (error) {
      return const ApiCheckResult.failure(LangKeys.loggedError);
    }
  }
}
