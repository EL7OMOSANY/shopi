import 'package:shopi/fetures/admin/fetures/users/data/models/delete_user_request.dart';

class UsersMutations {
  factory UsersMutations() {
    return _instance;
  }
  const UsersMutations._();

  static const UsersMutations _instance = UsersMutations._();

  //Users get all
  Map<String, dynamic> getAllUsersMutation() {
    return {
      'query': '''
            {
              users{
                  name
                  id
                  email

              }
          }
      ''',
    };
  }

  // delete user
  Map<String, dynamic> deleteUserMutation({
    required DeleteUserRequest deleteUserRequest,
  }) {
    return {
      'query': r'''
            mutation DeleteUser($userId: ID!) {
              deleteUser(id: $userId)
            }
      ''',
      'variables': {'userId': deleteUserRequest.id},
    };
  }
}
