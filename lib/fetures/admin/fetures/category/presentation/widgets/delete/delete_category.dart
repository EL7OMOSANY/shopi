import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/utils/toast_utils.dart';
import 'package:shopi/fetures/admin/fetures/category/data/models/delete_category.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';

class DeleteCategoryWidget extends StatelessWidget {
  const DeleteCategoryWidget({super.key, required this.categoryId});
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoriesCubit>();
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {
        if (state is SuccessDeleteCategoryState) {
          cubit.getAllCategories();
          ToastUtils.showSuccess(
            context,
            title: 'Success',
            message: 'Your category has been deleted',
          );
        } else if (state is ErrorDeleteCategoryState) {
          ToastUtils.showError(context, title: 'Error', message: state.error);
        }
      },
      builder: (context, state) {
        return state is LoadingDeleteCategoryState
            ? const CircularProgressIndicator(color: Colors.red)
            : InkWell(
                onTap: () {
                  cubit.deleteCategory(DeleteCategoryRequest(id: categoryId));
                },

                child: const Icon(Icons.delete, color: Colors.red, size: 35),
              );
      },
    );
  }
}
