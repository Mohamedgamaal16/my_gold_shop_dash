import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/home/model/perfomer_model.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class PerformerCard extends StatelessWidget {
  final PerformerModel performer;

  const PerformerCard({super.key, required this.performer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.23,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: const Color(0xFF6A7671),
            child: Text(
              performer.rank.toString(),
              style: AppTextStyles.bodyM(context).copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  performer.name,
                  style: AppTextStyles.bodyM(
                    context,
                  )?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Sales: ${performer.sales}',
                  style: AppTextStyles.bodyS(context),
                ),
                const SizedBox(height: 4),
                Text(
                  performer.growth,
                  style: AppTextStyles.bodyXxs(
                    context,
                  ).copyWith(color: Colors.green),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
