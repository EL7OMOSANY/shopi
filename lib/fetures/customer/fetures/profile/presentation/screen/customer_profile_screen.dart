import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/app/share_cubit/share_cubit.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/fetures/customer/fetures/favorits/presentation/cubit/customer_favorites_cubit.dart';
import 'package:shopi/fetures/customer/fetures/profile/presentation/cubit/cubit/customer_profile_cubit.dart';

import 'package:shopi/fetures/customer/fetures/profile/presentation/widgets/profile_body.dart';

class CustomerProfileScreen extends StatelessWidget {
  const CustomerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<CustomerProfileCubit>()..getUserInfo(),
          ),
          BlocProvider(create: (context) => getIt<ShareCubit>()),
          BlocProvider(create: (context) => getIt<CustomerFavoritesCubit>()),
        ],
        child: ProfileBody(),
      ),
    );
  }
}
