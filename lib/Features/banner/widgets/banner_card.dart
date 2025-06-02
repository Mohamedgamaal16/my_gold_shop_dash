import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/banner/model/banner_model.dart';
import 'package:my_gold_dashboard/core/shared_widget/caches_image.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class BannerCard extends StatelessWidget {
  final BannerModel banner;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const BannerCard({
    super.key,
    required this.banner,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.yellowColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row with two columns
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Merchant Name Column
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Merchant Name', style: AppTextStyles.bodyM(context)),
                    const SizedBox(height: 6),
                    TextFormField(
                      initialValue: banner.merchantName,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF134E4A),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF134E4A),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onChanged: (value) {
                        // Handle merchant name change if needed
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),

              /// Banner Image Column
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Banner Image', style: AppTextStyles.bodyM(context)),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.colorsPrimary2,
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                      ),
                      child: CachedImage(
                        topRightRadius: 16,
                        bottomRightRadius: 16,
                        bottomLeftRadius: 16,
                        topLeftRadius: 16,
                        imageUrl: banner.imageUrl,
                        onPressed: onEdit,
                        fit: BoxFit.cover,
                        height: 150,
                        width: MediaQuery.sizeOf(context).width * 0.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          /// Delete Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onDelete,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightRedColor,
                foregroundColor: AppColors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Delete',
                style: AppTextStyles.bodyM(
                  context,
                ).copyWith(color: AppColors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}