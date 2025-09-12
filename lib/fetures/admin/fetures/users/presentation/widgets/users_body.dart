import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/users_cubit/cubit/users_cubit.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/widgets/custom_users_list.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/widgets/search_for_users.dart';

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
              child: CustomUsersList(),
            ),
          ),
        ],
      ),
    );
  }
}
