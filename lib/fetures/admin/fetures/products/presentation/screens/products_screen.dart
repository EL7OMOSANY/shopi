import 'package:flutter/material.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/presentation/widgets/admin_appbar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(
        isMain: true,
        backgroundColor: context.color.mainColor!,
        title: 'Asroo Store',
      ),
      body: const Text('Products Screen'),
    );
  }
}
