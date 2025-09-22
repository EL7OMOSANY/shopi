import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/langs/lang_keys.dart';
import 'package:shopi/core/widgets/custom_app_bar.dart';
import 'package:shopi/fetures/admin/fetures/products/presentation/products_cubit/products_cubit.dart';
import 'package:shopi/fetures/customer/fetures/products_view_all/persentation/widgets/products_view_all_body.dart';

class CustomerProductViewAllScreen extends StatelessWidget {
  const CustomerProductViewAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductsCubit>()..getAllProducts(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.tr(LangKeys.viewAll)),
        body: const ProductsViewAllBody(),
      ),
    );
  }
}
