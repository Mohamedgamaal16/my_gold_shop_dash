import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/returns_managment/presentation/screens/returns_management_screen_body.dart';

class ReturnsManagementScreen extends StatelessWidget {
  const ReturnsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: ReturnsManagementScreenBody(),
    );
  }
}
