import 'package:flutter/material.dart';

import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final String percentageChange;
  final Color changeColor;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.percentageChange,
    required this.changeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.19,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.colorsSurface),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Text(
                title,
                style: AppTextStyles.bodyS(
                  context,
                ).copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: AppTextStyles.bodyM(
                  context,
                ).copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 4),
              Text(
                percentageChange,
                style: AppTextStyles.bodyXxs(
                  context,
                ).copyWith(color: changeColor),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: AppColors.greyScaleNearWhite,
            child: Icon(icon, size: 24, color: AppColors.greyScaleDarkGrey),
          ),
        ],
      ),
    );
  }
}
