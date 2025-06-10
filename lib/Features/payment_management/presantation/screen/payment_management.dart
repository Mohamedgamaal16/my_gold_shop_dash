import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/payment_management/presantation/screen/payment_management_body.dart';

import '../../../../core/styles/colors.dart';
import '../../../settings/widget/setting_appbar.dart';

class PaymentManagementScreen extends StatelessWidget {
  const PaymentManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorsBackground,
      appBar: buildAppBar(),
      body: PaymentManagementBody(),
    );
  }
}
