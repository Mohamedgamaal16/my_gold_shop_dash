import 'package:flutter/material.dart';

import '../../../core/styles/colors.dart';
import '../../settings/widget/setting_appbar.dart';
import 'customer_management_details_body.dart';

class CustomerManagementDetails extends StatelessWidget {
  const CustomerManagementDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorsBackground,
      appBar: buildAppBar(),
      body: CustomerManagementDetailsBody(customerId: "CUST-001",),
    );
  }
}
