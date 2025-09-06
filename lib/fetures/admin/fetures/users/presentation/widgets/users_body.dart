import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/users_cubit/cubit/users_cubit.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/widgets/search_for_users.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/widgets/table_for_users.dart';

class UsersBody extends StatelessWidget {
  const UsersBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UsersCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        children: [
          // Search For Users
          const SearchForUsers(),
          SizedBox(height: 20.h),
          //Table
          Flexible(
            child: RefreshIndicator(
              onRefresh: () async {
                cubit.getAllUsers();
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: BlocBuilder<UsersCubit, UsersState>(
                      builder: (context, state) {
                        if (state is LoadingGetAllUsersState) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
