import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../settings/widget/setting_appbar.dart';
import 'delivery_personnel_body.dart';

class DeliveryPersonnelScreen extends StatelessWidget {
  const DeliveryPersonnelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorsBackground,
      appBar: buildAppBar(),
      body: DeliveryPersonnelBody(),
    );
  }
}
