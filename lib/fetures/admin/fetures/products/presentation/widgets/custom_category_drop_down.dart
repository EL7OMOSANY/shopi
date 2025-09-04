import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/widgets/custom_create_drop_down.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/products_cubit/products_cubit.dart';

class CustomCategoryDropDown extends StatelessWidget {
  const CustomCategoryDropDown({
    super.key,
    required this.onChanged,
    required this.categoryName,
  });
  final void Function(String?) onChanged;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        final cubit = context.read<CategoriesCubit>();
        return state is LoadingUpdateProductState
            ? CustomCreateDropDown(
                hintText: '',
                items: const [''],
                onChanged: (value) {},
                value: null,
              )
            : CustomCreateDropDown(
                hintText: 'Select a Category',
                items: cubit.dropdownList,
                onChanged: onChanged,
                value: categoryName.isNotEmpty ? categoryName : null,
              );
      },
    );
  }
}
