import 'package:shopi/fetures/auth/user%20role/data/data%20source/user_role_data_source.dart';
import 'package:shopi/fetures/auth/user%20role/data/models/user_role_response.dart';

class UserRoleRepo {
  final UserRoleDataSource _dataSource;

  UserRoleRepo(this._dataSource);
  Future<UserRoleResponse> userRole(String token) async {
    final response = await _dataSource.userRoleDataSource(token);

    return response;
  }
}
