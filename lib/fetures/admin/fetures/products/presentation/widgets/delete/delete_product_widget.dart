import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/utils/toast_utils.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/delete_product.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/products_cubit/products_cubit.dart';

class DeleteProductWidget extends StatelessWidget {
  const DeleteProductWidget({required this.productId, super.key});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is SuccessDeleteProductState) {
            cubit.getAllProducts();
          } else if (state is ErrorDeleteProductState) {
            ToastUtils.showError(context, title: 'Error', message: state.error);
          }
        },
        builder: (context, state) {
          return state is LoadingDeleteProductState
              ? const Icon(
                  Icons.delete,
                  color: Color.fromARGB(255, 112, 32, 27),
                )
              : InkWell(
                  onTap: () {
                    cubit.deleteProduct(DeleteProduct(id: productId));

                    Future.delayed(const Duration(milliseconds: 700), () {
                      if (context.mounted) {
                        ToastUtils.showSuccess(
                          context,
                          title: 'Success',
                          message: 'Your product has been deleted',
                        );
                      }
                    });
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Color.fromARGB(255, 112, 32, 27),
                  ),
                );
        },
      ),
    );
  }
}
