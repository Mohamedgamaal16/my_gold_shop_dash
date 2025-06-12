import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../settings/widget/setting_appbar.dart';
import 'customer_management_body.dart';

class CustomerManagement extends StatelessWidget {
  const CustomerManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorsBackground,
      appBar: buildAppBar(),
      body: CustomerManagementBody(),
    );
  }
}
