part of 'users_cubit.dart';

sealed class UsersState {}

class UsersInitial extends UsersState {}

// get all users states

final class LoadingGetAllUsersState extends UsersState {}

final class SuccessGetAllUsersState extends UsersState {
  final List<UserModel> usersList;

  SuccessGetAllUsersState({required this.usersList});
}

final class ErrorGetAllUsersState extends UsersState {
  final String error;

  ErrorGetAllUsersState({required this.error});
}

// delete users states

final class LoadingDeleteUserState extends UsersState {}

final class SuccessDeleteUserState extends UsersState {}

final class DeleteUserState extends UsersState {}

final class ErrorDeleteUserState extends UsersState {
  final String error;

  ErrorDeleteUserState({required this.error});
}
