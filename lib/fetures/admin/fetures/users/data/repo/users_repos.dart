import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/core/services/graphql/api_service.dart';
import 'package:shopi/fetures/admin/fetures/users/data/graphql/users_mutations.dart';
import 'package:shopi/fetures/admin/fetures/users/data/models/delete_user_request.dart';
import 'package:shopi/fetures/admin/fetures/users/data/models/get_all_users_response.dart';

class UsersRepos {
  final ApiService _apiService;

  UsersRepos(this._apiService);

  //get all users
  Future<ApiCheckResult<GetAllUsersResponse>> getAllUsers() async {
    try {
      final result = await _apiService.getAllUsers(
        UsersMutations().getAllUsersMutation(),
      );
      return ApiCheckResult.success(result);
    } catch (error) {
      return ApiCheckResult.failure(error.toString());
    }
  }

  //delete user
  Future<ApiCheckResult<void>> deleteUser({
    required DeleteUserRequest deleteUserRequest,
  }) async {
    try {
      final response = await _apiService.deleteUser(
        UsersMutations().deleteUserMutation(
          deleteUserRequest: deleteUserRequest,
        ),
      );
      return ApiCheckResult.success(response);
    } catch (error) {
      return ApiCheckResult.failure(error.toString());
    }
  }
}
