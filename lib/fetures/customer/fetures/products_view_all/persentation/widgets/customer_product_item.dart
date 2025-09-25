import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/app/share_cubit/share_cubit.dart';
import 'package:shopi/core/constants/app_spacer.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/extensions/string_extentions.dart';
import 'package:shopi/core/routes/routes.dart';
import 'package:shopi/core/widgets/custom_container_linear_customer.dart';
import 'package:shopi/core/widgets/custom_favorite_button.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/get_all_products_response.dart';
import 'package:shopi/fetures/customer/fetures/favorits/presentation/cubit/customer_favorites_cubit.dart';

class CustomerProductItem extends StatelessWidget {
  const CustomerProductItem({
    required this.imageUrl,
    required this.title,
    required this.categoryName,
    required this.price,
    required this.productId,
    super.key,
  });

  final String imageUrl;
  final String title;
  final String categoryName;
  final double price;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushName(Routes.customerProductDetails, arguments: productId);
      },
      child: CustomContainerLinearCustomer(
        height: 250.h,
        width: 165.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // // Share Button
                BlocListener<ShareCubit, ShareState>(
                  listener: (context, state) {
                    if (state is ShareError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error: ${state.message}")),
                      );
                    } else if (state is ShareSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Shared successfully!")),
                      );
                    }
                  },
                  child: BlocBuilder<ShareCubit, ShareState>(
                    builder: (context, state) {
                      if (state is ShareLoading &&
                          state.productId == productId) {
                        return SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: context.color.bluePinkLight,
                          ),
                        );
                      }
                      return IconButton(
                        icon: const Icon(Icons.share, size: 22),
                        onPressed: () {
                          context.read<ShareCubit>().shareProduct(
                            title: title,
                            productId: productId,
                          );
                        },
                      );
                    },
                  ),
                ),

                // Favorite Button
                BlocBuilder<CustomerFavoritesCubit, CustomerFavoritesState>(
                  builder: (context, state) {
                    final favoritesCubit = context
                        .read<CustomerFavoritesCubit>();
                    return CustomFavoriteButton(
                      size: 25,
                      isFavorites: favoritesCubit.isFavorites(
                        productId.toString(),
                      ),
                      onTap: () {
                        favoritesCubit.manageFavourites(
                          ProductModel(
                            id: productId.toString(),
                            title: title,
                            price: price,
                            images: [imageUrl],
                            category: ProductCategoryData(
                              id: '',
                              name: categoryName,
                            ),
                            description: '',
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),

            // Image
            Flexible(
              child: Center(
                child: CachedNetworkImage(
                  height: 180.h,
                  width: 140.w,
                  imageUrl: imageUrl.imageProductFormate(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Color.fromARGB(255, 188, 51, 42),
                    size: 70,
                  ),
                ),
              ),
            ),
            // AppSpacing.h8,

            // title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5),
              child: TextApp(
                text: title,
                style: AppTextStyles.text12w700.copyWith(
                  color: context.color.textColor!.withOpacity(.7),
                ),
                maxLines: 1,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: SizedBox(
                    width: 75.w,
                    child: TextApp(
                      text: categoryName,
                      style: AppTextStyles.text12w700.copyWith(
                        color: context.color.textColor!.withOpacity(.7),
                      ),
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),

                // Price
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: TextApp(
                    text: '\$ $price',
                    style: AppTextStyles.text12w400.copyWith(
                      color: context.color.textColor!.withOpacity(.7),
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            AppSpacing.v8,
          ],
        ),
      ),
    );
  }
}
