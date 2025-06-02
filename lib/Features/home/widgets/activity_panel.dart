import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/home/model/activity_model.dart';
import 'package:my_gold_dashboard/Features/home/widgets/acitvity_item.dart';
import 'package:my_gold_dashboard/core/shared_widget/custom_button.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class RecentActivitiesPanel extends StatelessWidget {
  const RecentActivitiesPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ActivityModel> activities = [
      ActivityModel(
        title: 'Order #1234 accepted by delivery agent Ahmed',
        subtitle: 'Delivery Agent',
        time: '10 min ago',
        buttonLabel: 'View Details',
      ),
      ActivityModel(
        title: "New merchant 'Gold Palace' registered",
        subtitle: 'Merchant',
        time: '30 min ago',
      ),
      ActivityModel(
        title: 'Customer complaint resolved for Order #1228',
        subtitle: 'Customer Support',
        time: '1 hour ago',
      ),
      ActivityModel(
        title: 'Customer complaint resolved for Order #1228',
        subtitle: 'Customer Support',
        time: '1 hour ago',
      ),
    ];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.colorsSurface),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Activities',
                style: AppTextStyles.bodyL(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              CustomButton(
                width: 100,
                isPrimary: false,
                labelName: '${activities.length} Activities',
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Activity Items
          ...activities.map(
            (activity) => Column(
              children: [
                ActivityItem(activity: activity),
                const Divider(height: 24),
              ],
            ),
          ),

          // View All link
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                'View all activities',
                style: AppTextStyles.bodyM(
                  context,
                ).copyWith(color: AppColors.colorsPrimary2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
