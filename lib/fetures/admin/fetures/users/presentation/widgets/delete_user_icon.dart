import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/utils/toast_utils.dart';
import 'package:shopi/fetures/admin/fetures/users/data/models/delete_user_request.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/users_cubit/cubit/users_cubit.dart';

class DeleteUserIcon extends StatelessWidget {
  const DeleteUserIcon({required this.userId, super.key});

  final String userId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UsersCubit>();

    return BlocConsumer<UsersCubit, UsersState>(
      listener: (context, state) {
        if (state is SuccessDeleteUserState) {
          ToastUtils.showSuccess(
            context,
            message: 'User has been deleted',
            title: 'Done',
          );
        }

        if (state is ErrorDeleteUserState) {
          ToastUtils.showError(context, message: state.error, title: 'Error');
        }
      },
      builder: (context, state) {
        // لو في حالة تحميل لليوزر ده → أظهر Progress
        if (state is LoadingDeleteUserState && cubit.deletingUserId == userId) {
          return const SizedBox(
            height: 30,
            width: 30,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            ),
          );
        }
        return GestureDetector(
          onTap: () {
            cubit.deleteUser(DeleteUserRequest(id: userId));
            Future.delayed(const Duration(milliseconds: 300), () {
              if (context.mounted) {
                ToastUtils.showSuccess(
                  context,
                  message: 'User has been deleted',
                  title: 'Done',
                );
              }
            });
          },
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.delete, color: Colors.red, size: 25),
          ),
        );
      },
    );
  }
}
