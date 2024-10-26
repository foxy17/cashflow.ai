import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:cashflow_ai/shared/shared.dart';

@RoutePage()
class HomeTabScreen extends StatelessWidget {
  static const String name = 'HomeTabScreen';
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home', style: TextStyle(color: context.colors.black))),
      body: Center(
        child: Text(
          'Welcome to the Home tab!',
          style: TextStyle(color: context.colors.gunMetal),
        ),
      ),
    );
  }
}
