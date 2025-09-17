part of 'customer_profile_cubit.dart';

sealed class CustomerProfileState {}

final class CustomerProfileInitial extends CustomerProfileState {}

final class CustomerProfileLoading extends CustomerProfileState {}

final class CustomerProfileSuccess extends CustomerProfileState {
  final UserRoleResponse userinfo;
  CustomerProfileSuccess({required this.userinfo});
}

final class CustomerProfileError extends CustomerProfileState {
  final String error;
  CustomerProfileError({required this.error});
}
