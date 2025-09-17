import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/fetures/customer/fetures/profile/presentation/cubit/cubit/customer_profile_cubit.dart';

import 'package:shopi/fetures/customer/fetures/profile/presentation/widgets/profile_body.dart';

class CustomerProfileScreen extends StatelessWidget {
  const CustomerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<CustomerProfileCubit>()..getUserInfo(),
        child: ProfileBody(),
      ),
    );
  }
}
