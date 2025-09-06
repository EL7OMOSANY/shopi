import 'dart:developer';

import 'package:dio/dio.dart';
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

    if (!formKey.currentState!.validate()) {
      emit(LoginError(message: "Please fill all fields correctly"));
      return;
    }

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
          log("✅ Login Success in cubit, token: $token");

          await SharedPref().setString(SharedPrefKeys.accessToken, token);

          // Get role
          final user = await authRepo.userRole(token);
          await SharedPref().setInt(SharedPrefKeys.userId, user.userId ?? 0);
          await SharedPref().setString(
            SharedPrefKeys.userRole,
            user.userRole ?? '',
          );

          log("👤 Role in cubit: ${user.userRole}");
          emit(LoginSuccess(role: user.userRole ?? ''));
        },
        failure: (error) {
          log("❌ Login Failed: $error");
          emit(LoginError(message: error));
        },
      );
    } on DioException catch (e) {
      log("❌ Dio Exception in login: $e");
      emit(LoginError(message: e.message ?? "Unknown Dio Error"));
    } catch (e) {
      log("❌ General Exception in login: $e");
      emit(LoginError(message: e.toString()));
    }
  }
}
