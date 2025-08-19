import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('customer Home')),
      body: Center(child: Text('Welcome to the Admin Home Screen!')),
    );
  }
}
