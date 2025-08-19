import 'package:shopi/fetures/auth/login/data/models/login_request.dart';

class LoginMutation {
  factory LoginMutation() {
    return instance;
  }
  const LoginMutation._();
  static const LoginMutation instance = LoginMutation._();

  Map<String, dynamic> loginMutation({required LoginRequest loginRequest}) {
    return {
      'query': r'''
          mutation Login($email: String!, $password: String!) {
            login(email: $email, password: $password) {
              access_token
              refresh_token
            }
          }
        ''',
      'variables': {
        'email': loginRequest.email,
        'password': loginRequest.password,
      },
    };
  }
}
