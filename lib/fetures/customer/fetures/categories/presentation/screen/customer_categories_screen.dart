import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:shopi/fetures/customer/fetures/categories/presentation/widgets/customer_categories_body.dart';

class CustomerCategoriesScreen extends StatelessWidget {
  const CustomerCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoriesCubit>()..getAllCategories(),
      child: Scaffold(body: const CustomerCategoriesBody()),
    );
  }
}
