import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/app/share_cubit/share_cubit.dart';
import 'package:shopi/core/di/di.dart';

import 'package:shopi/core/widgets/custom_app_bar.dart';
import 'package:shopi/fetures/customer/fetures/favorits/presentation/cubit/customer_favorites_cubit.dart';
import 'package:shopi/fetures/customer/fetures/search/presentation/cubit/customer_search_cubit.dart';
import 'package:shopi/fetures/customer/fetures/search/presentation/widgets/search_body.dart';

class CustomerSearchScreen extends StatelessWidget {
  const CustomerSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CustomerSearchCubit>()),
        BlocProvider(create: (context) => getIt<ShareCubit>()),
        BlocProvider(create: (context) => getIt<CustomerFavoritesCubit>()),
      ],
      child: const Scaffold(
        appBar: CustomAppBar(title: 'Search'),
        body: SearchBody(),
      ),
    );
  }
}
