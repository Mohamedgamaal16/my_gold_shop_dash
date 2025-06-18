import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/merchant_management/merchant_details_screen/presentation/screens/merchant_detail_body.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../settings/widget/setting_appbar.dart';

class MerchantDetailScreen extends StatelessWidget {
  final String merchantId;
  const MerchantDetailScreen({super.key , required this.merchantId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorsBackground,
      appBar: buildAppBar(),
      body: MerchantDetailBody(merchantId: merchantId),
    );
  }
}
