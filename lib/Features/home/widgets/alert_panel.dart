import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/home/model/alert_model.dart';
import 'package:my_gold_dashboard/Features/home/widgets/alert_item.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class SystemAlertsPanel extends StatelessWidget {
  const SystemAlertsPanel({super.key});
  @override
  Widget build(BuildContext context) {
    final List<AlertModel> alerts = [
      AlertModel(
        title: 'Order successfully Received by client',
        message: 'Scheduled maintenance was completed successfully',
        time: '30 minutes ago',
        type: AlertType.success,
      ),
      AlertModel(
        title: 'Delay in Order #1234',
        message: 'Delivery agent reported a 2-hour delay due to traffic',
        time: '1 hour ago',
        type: AlertType.warning,
      ),
      AlertModel(
        title: 'Payment Failed for Order #1230',
        message: "Customer's credit card was declined",
        time: '1 hour ago',
        type: AlertType.error,
      ),
    ];
    return Container(
      color: AppColors.colorsSurface,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'System Alerts',
            style: AppTextStyles.bodyL(
              context,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...alerts.map(
            (alert) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AlertItem(alert: alert),
            ),
          ),
        ],
      ),
    );
  }
}
