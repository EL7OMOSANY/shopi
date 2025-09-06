import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/fetures/admin/fetures/users/data/models/delete_user_request.dart';
import 'package:shopi/fetures/admin/fetures/users/data/models/get_all_users_response.dart';
import 'package:shopi/fetures/admin/fetures/users/data/repo/users_repos.dart';
part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this._repo) : super(UsersInitial());

  final UsersRepos _repo;
  List<UserModel> usersList = [];

  final searchController = TextEditingController();
  String? deletingUserId; // <-- هنا

  //delete user
  Future<void> deleteUser(DeleteUserRequest deleteUserRequest) async {
    deletingUserId = deleteUserRequest.id;
    emit(LoadingDeleteUserState());

    final result = await _repo.deleteUser(deleteUserRequest: deleteUserRequest);

    result.when(
      success: (_) {
        usersList.removeWhere((user) => user.id == deleteUserRequest.id);
        deletingUserId = null;
        emit(SuccessDeleteUserState());
        emit(SuccessGetAllUsersState(usersList: usersList));
      },
      failure: (error) {
        deletingUserId = null;
        emit(ErrorDeleteUserState(error: error));
      },
    );
  }

  //get all users

  Future<void> getAllUsers() async {
    emit(LoadingGetAllUsersState());

    final result = await _repo.getAllUsers();

    result.when(
      success: (response) {
        usersList = response.usersList;

        emit(SuccessGetAllUsersState(usersList: response.usersList));
      },
      failure: (error) {
        emit(ErrorGetAllUsersState(error: error));
      },
    );
  }

  //search for user

  FutureOr<void> searchUser(String search) {
    emit(LoadingGetAllUsersState());

    if (search.trim().isEmpty) {
      emit(SuccessGetAllUsersState(usersList: usersList));

      return null;
    }

    final searchResult = usersList
        .where((user) => user.name.toLowerCase().contains(search.toLowerCase()))
        .toList();

    if (searchResult.isEmpty) {
      emit(ErrorGetAllUsersState(error: "No results found for $search"));
    } else {
      emit(SuccessGetAllUsersState(usersList: searchResult));
    }
  }
}
