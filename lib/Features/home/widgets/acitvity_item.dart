import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/home/model/activity_model.dart';
import 'package:my_gold_dashboard/core/shared_widget/custom_button.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class ActivityItem extends StatelessWidget {
  final ActivityModel activity;

  const ActivityItem({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dot
        CircleAvatar(
          radius: 16,
          backgroundColor: AppColors.trafficLightColorsWarning,
        ),
        const SizedBox(width: 16),

        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(activity.title, style: AppTextStyles.bodyM(context)),
              const SizedBox(height: 4),
              Text(
                activity.subtitle,
                style: AppTextStyles.bodyS(
                  context,
                ).copyWith(color: Colors.grey),
              ),
              if (activity.buttonLabel != null)
                CustomButton(
                  width: 100,
                  isPrimary: false,
                  labelName: activity.buttonLabel!,
                  onPressed: () {},
                ),
            ],
          ),
        ),

        // Time
        Row(
          children: [
            const Icon(Icons.schedule, size: 16, color: Colors.grey),
            const SizedBox(width: 4),
            Text(
              activity.time,
              style: AppTextStyles.bodyXxs(
                context,
              ).copyWith(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
