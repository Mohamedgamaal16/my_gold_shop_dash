import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/reports/presentation/screen/reports_body.dart';

import '../../../../core/styles/colors.dart';
import '../../../settings/widget/setting_appbar.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorsBackground,
      appBar: buildAppBar(),
      body: ReportsBody(),
    );
  }
}
