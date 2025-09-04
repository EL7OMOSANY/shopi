import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/buutom_sheet/custom_buttom_sheet.dart';
import 'package:shopi/fetures/admin/fetures/category/data/models/update_category_request.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/widgets/update/update_category_button.dart';

class EditCategoryButton extends StatelessWidget {
  const EditCategoryButton({
    super.key,
    required this.categoryId,
    required this.name,
    required this.image,
  });

  final String categoryId;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _updateCategoryBottomSheet(
          context,
          UpdateCategoryRequest(id: categoryId, name: name, image: image),
        );
      },
      child: const Icon(Icons.edit, color: Colors.green, size: 35),
    );
  }

  void _updateCategoryBottomSheet(
    BuildContext context,
    UpdateCategoryRequest updateCategoryRequest,
  ) {
    final cubit = context.read<CategoriesCubit>();

    CustomButtomSheet.showModalBottomSheetContainer(
      context: context,
      widget: BlocProvider.value(
        value: cubit,
        child: UpdateCategoryBottomWidget(
          categoryId: categoryId,
          ctageoryName: name,
          imageUrl: image,
        ),
      ),
      whenComplete: () {
        cubit.getAllCategories();
      },
    );
  }
}
