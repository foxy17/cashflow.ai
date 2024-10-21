import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ReportTabScreen extends StatelessWidget {
  static const String name = 'ReportTabScreen';
  const ReportTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report')),
      body: const Center(child: Text('Welcome to the Report tab!')),
    );
  }
}
