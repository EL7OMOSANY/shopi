import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/buutom_sheet/custom_buttom_sheet.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/widgets/custom_admin_container.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shopi/fetures/admin/fetures/category/data/models/update_category_request.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/widgets/delete/delete_category.dart';
import 'package:shopi/fetures/admin/fetures/category/presentation/widgets/update/update_category_button.dart';

class AddCatgeoryItem extends StatelessWidget {
  const AddCatgeoryItem({
    required this.name,
    required this.image,
    required this.categoryId,
    super.key,
  });

  final String name;
  final String image;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 200.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                TextApp(
                  text: name,
                  style: AppTextStyles.text24w700.copyWith(color: Colors.white),
                ),
                Spacer(),
                Row(
                  children: [
                    //Delete
                    DeleteCategoryWidget(categoryId: categoryId),
                    SizedBox(width: 20.h),
                    //Update
                    InkWell(
                      onTap: () {
                        _updateCategoryBottomSheet(
                          context,
                          UpdateCategoryRequest(
                            id: categoryId,
                            name: name,
                            image: image,
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.edit,
                        color: Colors.green,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
            //image
            Flexible(
              child: CachedNetworkImage(
                height: 150.h,
                width: 100.w,
                imageUrl: image,
                // fit: BoxFit.fill,
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.red, size: 70),
              ),
            ),
          ],
        ),
      ),
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
