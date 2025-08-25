import 'package:shopi/fetures/auth/signup/data/models/sign_up_request.dart';

class SignupMutation {
  factory SignupMutation() {
    return instance;
  }
  const SignupMutation._();
  static const SignupMutation instance = SignupMutation._();

  Map<String, dynamic> signUpMutation({required SignUpRequest signUpRequest}) {
    return {
      'query': r'''
              mutation SignUp($name: String!, $email: String! , $password: String!, $avatar: String!) {
              addUser(
                data: {
                  name: $name
                  email: $email
                  password:$password
                  avatar: $avatar
                  role: customer
                }
              ) {
                id
                email
              }
            }
        ''',
      'variables': {
        'name': signUpRequest.name,
        'email': signUpRequest.email,
        'password': signUpRequest.password,
        'avatar': signUpRequest.avatar,
      },
    };
  }
}
