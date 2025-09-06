import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/presentation/widgets/admin_appbar.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/users_cubit/cubit/users_cubit.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/widgets/users_body.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(
        isMain: true,
        backgroundColor: context.color.mainColor!,
        title: 'Users',
      ),
      body: BlocProvider(
        create: (context) => getIt<UsersCubit>()..getAllUsers(),
        child: UsersBody(),
      ),
    );
  }
}
