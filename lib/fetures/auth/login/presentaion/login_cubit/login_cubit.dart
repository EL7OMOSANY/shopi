import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';
import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/fetures/auth/auth_repos/auth_repos.dart';
import 'package:shopi/fetures/auth/login/data/models/login_request.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepos authRepo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(LoginLoading());

    try {
      final result = await authRepo.login(
        LoginRequest(
          email: emailController.text.trim(),
          password: passwordController.text,
        ),
      );

      result.when(
        success: (response) async {
          final String token = response.data?.loginData?.accessToken ?? '';
          log("Login Success in login cubit response token: $token");
          await SharedPref().setString(SharedPrefKeys.accessToken, token);

          final user = await authRepo.userRole(token);
          await SharedPref().setInt(SharedPrefKeys.userId, user.userId ?? 0);
          await SharedPref().setString(
            SharedPrefKeys.userRole,
            user.userRole ?? '',
          );

          log("user role in login cubit : ${user.userRole}");

          emit(LoginSuccess(role: user.userRole ?? ''));
        },
        failure: (error) {
          emit(LoginError(message: "Login Error in login cubit  : $error"));
        },
      );
    } catch (e) {
      emit(LoginError(message: "Login Error in login cubit response  : $e"));
    }
  }
}
