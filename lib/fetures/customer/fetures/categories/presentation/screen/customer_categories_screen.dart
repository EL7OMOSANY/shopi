import 'package:flutter/material.dart';
import 'package:shopi/core/widgets/custom_app_bar.dart';

class CustomerCategoriesScreen extends StatelessWidget {
  const CustomerCategoriesScreen({super.key, required this.categoryInfo});

  final ({String categoryName, int categoryId}) categoryInfo;
  @override
  Widget build(BuildContext context) {
    return
    // BlocProvider(
    //   create: (context) => sl<GetCategoryBloc>()
    //     ..add(
    //       GetCategoryEvent.getCategory(categoryId: categoryInfo.categoryId),
    //     ),
    //   child:
    Scaffold(
      appBar: CustomAppBar(title: categoryInfo.categoryName),
      //   body: const CategoryBody(),
      // ),
    );
  }
}
