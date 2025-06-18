import 'package:flutter/material.dart';

import 'merchant_attachment_card.dart';

class MerchantAttachmentsGrid extends StatelessWidget {
  final List<Map<String, String?>> attachments;

  const MerchantAttachmentsGrid({
    super.key,
    required this.attachments,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String?>> attachments = [
      {'title': 'National ID', 'imagePath': 'assets/idetity/license.png'},
      {'title': 'صورة السجل التجاري', 'imagePath': 'assets/idetity/license.png'},
      {'title': 'صورة وثيقة ممارس حر', 'imagePath': 'assets/idetity/license.png'},
      {'title': 'صورة وثيقة ممارس حر', 'imagePath': 'assets/idetity/license.png'},
      {'title': 'صورة ترخيص وزارة الإستثمار', 'imagePath': 'assets/idetity/license.png'},
      {'title': 'صورة المحل من الخارج', 'imagePath': 'assets/idetity/license.png'},
      {'title': 'صورة المحل من الداخل', 'imagePath': 'assets/idetity/license.png'},
      {'title': 'صورة رقم ال700', 'imagePath': 'assets/idetity/license.png'},
      {'title': 'صورة الرقم الوطني الموحد', 'imagePath': 'assets/idetity/license.png'},
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        final int crossAxisCount = constraints.maxWidth ~/ 170;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: attachments.length + 1,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount.clamp(1, 5),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            if (index < attachments.length) {
              final item = attachments[index];
              return MerchantAttachmentCard(
                title: item['title'] ?? '',
                imagePath: item['imagePath'],
              );
            } else {
              return const MerchantAttachmentCard(
                title: 'أضف ملفات اخرى',
              );
            }
          },
        );
      },
    );
  }
}
