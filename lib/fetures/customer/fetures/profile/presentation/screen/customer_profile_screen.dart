import 'package:flutter/material.dart';

import 'package:shopi/fetures/customer/fetures/profile/presentation/widgets/profile_body.dart';

class CustomerProfileScreen extends StatelessWidget {
  const CustomerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ProfileBody(),
    );
  }
}
