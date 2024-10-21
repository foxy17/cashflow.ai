import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserTabScreen extends StatelessWidget {
  static const String name = 'UserTabScreen';
  const UserTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User')),
      body: const Center(child: Text('Welcome to the User tab!')),
    );
  }
}
