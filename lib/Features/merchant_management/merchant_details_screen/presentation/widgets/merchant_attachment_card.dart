import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class MerchantAttachmentCard extends StatelessWidget {
  final String title;
  final String? imagePath;
  final VoidCallback? onUpload;

  const MerchantAttachmentCard({
    super.key,
    required this.title,
    this.imagePath,
    this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    final isPlaceholder = imagePath == null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyS(context).copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Container(
          width: 257,
          height: 229,
          decoration: BoxDecoration(
            color: AppColors.lightGreenColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.colorsPrimary2,
              width: 1,
              style: isPlaceholder ? BorderStyle.solid : BorderStyle.solid,
            ),
          ),
          child: isPlaceholder
              ? InkWell(
            onTap: onUpload,
            borderRadius: BorderRadius.circular(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/upload.svg',
                  width: 32,
                  height: 32,
                  color: AppColors.colorsPrimary2,
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    text: 'Choose',
                    style: AppTextStyles.bodyM(context).copyWith(
                      color: AppColors.colorsPrimary2,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: ' File To Upload',
                        style: AppTextStyles.bodyM(context).copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
              : Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                  child: Image.asset(
                    imagePath!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Container(
                height: 36,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.colorsPrimary2,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                ),
                child: Text(
                  'Pdf_2024_04',
                  style: AppTextStyles.bodyM(context).copyWith(
                    color: AppColors.colorsSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
