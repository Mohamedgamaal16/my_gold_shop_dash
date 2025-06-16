import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../settings/widget/setting_appbar.dart';
import 'merchant_management_body.dart';

class MerchantManagementScreen extends StatelessWidget {
  const MerchantManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorsBackground,
      appBar: buildAppBar(),
      body: MerchantManagementBody(),
    );
  }
}
