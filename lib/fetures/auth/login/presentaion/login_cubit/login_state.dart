part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String role;

  LoginSuccess({required this.role});
}

final class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});
}
