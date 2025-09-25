import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/app/share_cubit/share_cubit.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/widgets/animated_up_button.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/products_cubit/products_cubit.dart';
import 'package:shopi/fetures/customer/fetures/favorits/presentation/cubit/customer_favorites_cubit.dart';
import 'package:shopi/fetures/customer/fetures/home/presentation/cubit/cubit/customer_home_cubit.dart';
import 'package:shopi/fetures/customer/fetures/home/presentation/widgets/customer_home_body.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CustomerHomeCubit>()..getBanners(),
        ),
        BlocProvider(
          create: (context) => getIt<CategoriesCubit>()..getAllCategories(),
        ),
        BlocProvider(
          create: (context) => getIt<ProductsCubit>()..getAllProducts(),
        ),
        BlocProvider(create: (context) => getIt<CustomerFavoritesCubit>()),
        BlocProvider(create: (context) => getIt<ShareCubit>()),
      ],
      child: Stack(
        children: [
          //body
          CustomerHomeBody(scrollCOntroller: scrollController),

          AnimatedUpButton(scrollCntroller: scrollController),
        ],
      ),
    );
  }
}
