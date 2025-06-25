import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

import 'live_dots_indicator.dart';

class DashboardHeader extends StatelessWidget {
  final int totalComplaints;

  const DashboardHeader({
    super.key,
    required this.totalComplaints,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: const BoxDecoration(
        color: AppColors.colorsSurface,
        border: Border(
          bottom: BorderSide(
            color:AppColors.colorsBackground,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            'New Complaints',
            style: AppTextStyles.bodyL(
              context
            ),
          ),
          LiveUpdatesIndicator(complaintsCount: totalComplaints),
        ],
      ),
    );
  }
}