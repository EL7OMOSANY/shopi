import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/style/colors/dark_colors.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/widgets/category_body.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/presentation/widgets/admin_appbar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.mainColor,
      appBar: const AdminAppBar(
        title: 'Categories',
        isMain: true,
        backgroundColor: ColorsDark.mainColor,
      ),
      body: BlocProvider(
        create: (context) => getIt<CategoriesCubit>()..getAllCategories(),
        child: const CategoryBody(),
      ),
    );
  }
}
