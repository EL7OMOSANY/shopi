import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/buutom_sheet/custom_buttom_sheet.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/products_cubit/products_cubit.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/widgets/updae/update_product_bottom_sheet.dart';

class UpdateProductWidget extends StatelessWidget {
  const UpdateProductWidget({
    super.key,
    required this.imageList,
    required this.description,
    required this.price,
    required this.productId,
    required this.title,
    required this.categoryName,
    required this.categoryId,
  });
  final List<String> imageList;
  final String description;
  final String price;
  final String productId;
  final String title;
  final String categoryName;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        CustomButtomSheet.showModalBottomSheetContainer(
          context: context,
          widget: BlocProvider(
            create: (context) => getIt<ProductsCubit>()..getAllProducts(),
            child: UpdateProductBottomSheet(
              imageList: imageList,
              categoryName: categoryName,
              description: description,
              price: price,
              productId: productId,
              title: title,
              categoryId: categoryId,
            ),
          ),
          whenComplete: () {
            context.read<ProductsCubit>().getAllProducts();
          },
        );
      },
      padding: EdgeInsets.zero,
      icon: const Icon(Icons.edit, color: Color.fromARGB(255, 49, 51, 42)),
    );
  }
}
