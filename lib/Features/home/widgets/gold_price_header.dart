import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class GoldPriceHeader extends StatelessWidget {
  const GoldPriceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorsPrimary2,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gold Price Today',
                style: AppTextStyles.bodyM(
                  context,
                ).copyWith(color: AppColors.colorsSurface),
              ),
              Text(
                "Last Update: June 15, 2025 – 10:30 AM",
                style: AppTextStyles.bodyXxs(
                  context,
                ).copyWith(color: AppColors.colorsSurface),
              ),
            ],
          ),
          Text(
            '285.75 SAR',
            style: AppTextStyles.heading3(
              context,
            ).copyWith(color: AppColors.yellowColor),
          ),
          Text(
            "per gram",
            style: AppTextStyles.bodyS(
              context,
            ).copyWith(color: AppColors.colorsSurface),
          ),
          Divider(color: AppColors.colorsSecondary2, thickness: 0.5),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildGoldType('24K', '285.75 SAR'),
              _buildGoldType('21K', '261.747 SAR'),
              _buildGoldType('18K', '214.313 SAR'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGoldType(String type, String price) {
    return Column(
      children: [
        Text(type, style: TextStyle(color: AppColors.colorsSurface)),
        Text(
          price,
          style: TextStyle(
            color: AppColors.yellowColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
