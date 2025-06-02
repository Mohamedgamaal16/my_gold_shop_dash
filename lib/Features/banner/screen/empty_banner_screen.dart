import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/shared_widget/custom_button.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class EmptyBannerScreen extends StatelessWidget {
  final VoidCallback? onAddBanner;

  const EmptyBannerScreen({super.key, this.onAddBanner});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_outlined,
            size: 100,
            color: AppColors.greyScaleLightGrey,
          ),
          const SizedBox(height: 24),
          Text(
            'No Banners Found',
            style: AppTextStyles.heading4(
              context,
            ).copyWith(color: AppColors.greyScaleLightGrey),
          ),
          const SizedBox(height: 12),
          Text(
            'Add your first banner to get started',
            style: AppTextStyles.bodyM(
              context,
            ).copyWith(color: AppColors.greyScaleLightGrey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          CustomButton(
            labelName: "Add New Banner",
            onPressed: () => onAddBanner,
            width: MediaQuery.sizeOf(context).width * 0.3,
          ),
        ],
      ),
    );
  }
}
