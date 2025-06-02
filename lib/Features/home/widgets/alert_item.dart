import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/home/model/alert_model.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class AlertItem extends StatelessWidget {
  final AlertModel alert;

  const AlertItem({super.key, required this.alert});

  Color getBackgroundColor() {
    switch (alert.type) {
      case AlertType.success:
        return const Color(0xFFD4FCD6);
      case AlertType.warning:
        return const Color(0xFFFFF1C2);
      case AlertType.error:
        return const Color(0xFFFFE0E0);
    }
  }

  IconData getIconData() {
    switch (alert.type) {
      case AlertType.success:
        return Icons.check_circle_outline;
      case AlertType.warning:
        return Icons.warning_amber_outlined;
      case AlertType.error:
        return Icons.error_outline;
    }
  }

  Color getIconColor() {
    switch (alert.type) {
      case AlertType.success:
        return Colors.green;
      case AlertType.warning:
        return Colors.orange;
      case AlertType.error:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: getBackgroundColor()),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(getIconData(), color: getIconColor()),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(alert.title, style: AppTextStyles.bodyM(context)),
                const SizedBox(height: 4),
                Text(
                  alert.message,
                  style: AppTextStyles.bodyS(
                    context,
                  ).copyWith(color: Colors.black87),
                ),
                const SizedBox(height: 8),
                Text(
                  alert.time,
                  style: AppTextStyles.bodyXxs(
                    context,
                  ).copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
