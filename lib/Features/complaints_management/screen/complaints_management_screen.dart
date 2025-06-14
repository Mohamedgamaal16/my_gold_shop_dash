import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/complaints_management/screen/complaints_management_screen_body.dart';

class ComplaintsManagementScreen extends StatelessWidget {
  const ComplaintsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: ComplaintsManagementScreenBody(),
    );
  }
}
