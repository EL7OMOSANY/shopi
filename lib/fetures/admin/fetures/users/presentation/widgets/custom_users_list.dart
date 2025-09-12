import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/users_cubit/cubit/users_cubit.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/widgets/table_for_users.dart';

class CustomUsersList extends StatelessWidget {
  const CustomUsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: BlocBuilder<UsersCubit, UsersState>(
            builder: (context, state) {
              if (state is LoadingGetAllUsersState) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              } else if (state is SuccessGetAllUsersState) {
                return TableForUsers(userList: state.usersList);
              } else if (state is ErrorGetAllUsersState) {
                return Center(
                  child: Text(
                    state.error,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 25.h)),
      ],
    );
  }
}
