import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/customer/fetures/favorits/presentation/cubit/customer_favorites_cubit.dart';
import 'package:shopi/fetures/customer/fetures/products_view_all/persentation/widgets/customer_product_item.dart';

class CustomerFavorietsBody extends StatelessWidget {
  const CustomerFavorietsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
      child: BlocBuilder<CustomerFavoritesCubit, CustomerFavoritesState>(
        builder: (context, state) {
          final favoritesCubit = context.read<CustomerFavoritesCubit>();

          if (favoritesCubit.favoritesLis.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_outline,
                  color: context.color.textColor,
                  size: 150,
                ),
                TextApp(
                  text: 'Choose Your Favorite Products',
                  style: AppTextStyles.text16w700.copyWith(
                    color: context.color.textColor,
                  ),
                ),
              ],
            );
          }

          return GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: favoritesCubit.favoritesLis.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //Number of cloums
              crossAxisSpacing: 8, // Spacing between colums
              mainAxisSpacing: 15, //Spacing between rows
              childAspectRatio: 165 / 250,
            ),
            itemBuilder: (context, index) {
              final product = favoritesCubit.favoritesLis[index];
              return CustomerProductItem(
                imageUrl: product.image,
                title: product.title,
                categoryName: product.categoryName,
                price: double.tryParse(product.price) ?? 0.0,
                productId: int.tryParse(product.id) ?? 0,
              );
            },
          );
        },
      ),
    );
  }
}
