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
      // height: MediaQuery.of(context).size.height * 0.4, // ✅ Responsive outer height (40% of screen)
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.colorsSurface),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'System Alerts',
            style: AppTextStyles.bodyL(context).copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Scrollable alert list
          Expanded(
            child: ListView.separated(
              itemCount: alerts.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) => AlertItem(alert: alerts[index]),
            ),
          ),
        ],
      ),
    );
  }
}
