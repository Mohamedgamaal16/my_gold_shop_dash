import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/home/model/perfomer_model.dart';
import 'package:my_gold_dashboard/Features/home/widgets/perform_card.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class TopPerformersPanel extends StatefulWidget {
  const TopPerformersPanel({super.key});

  @override
  State<TopPerformersPanel> createState() => _TopPerformersPanelState();
}

class _TopPerformersPanelState extends State<TopPerformersPanel> {
  String selectedCategory = 'Merchants';

  final Map<String, List<PerformerModel>> categoryData = {
    'Merchants': [
      PerformerModel(
        name: 'Gold Palace',
        rank: 1,
        sales: '1,245,000 SAR',
        growth: '+12% vs last month',
      ),
      PerformerModel(
        name: 'Gold Palace',
        rank: 2,
        sales: '1,245,000 SAR',
        growth: '+12% vs last month',
      ),
      PerformerModel(
        name: 'Gold Palace',
        rank: 3,
        sales: '1,245,000 SAR',
        growth: '+12% vs last month',
      ),
    ],
    'Delivery': [
      PerformerModel(
        name: 'Fast Express',
        rank: 1,
        sales: '980,000 SAR',
        growth: '+10% vs last month',
      ),
      PerformerModel(
        name: 'SpeedyGo',
        rank: 2,
        sales: '940,000 SAR',
        growth: '+8% vs last month',
      ),
      PerformerModel(
        name: 'QuickTrack',
        rank: 3,
        sales: '910,000 SAR',
        growth: '+6% vs last month',
      ),
    ],
    'Products': [
      PerformerModel(
        name: 'Gold Ring',
        rank: 1,
        sales: '500,000 SAR',
        growth: '+15% vs last month',
      ),
      PerformerModel(
        name: 'Diamond Chain',
        rank: 2,
        sales: '450,000 SAR',
        growth: '+10% vs last month',
      ),
      PerformerModel(
        name: 'Silver Bracelet',
        rank: 3,
        sales: '430,000 SAR',
        growth: '+7% vs last month',
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final performers = categoryData[selectedCategory]!;

    return Container(
      color: AppColors.colorsSurface,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Performers',
                style: AppTextStyles.bodyL(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children:
                      ['Merchants', 'Delivery', 'Products'].map((category) {
                        final isSelected = category == selectedCategory;
                        return GestureDetector(
                          onTap:
                              () => setState(() => selectedCategory = category),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? Colors.white
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              category,
                              style: const TextStyle(
                                color: Color(0xFF0F2B28),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
                performers.map((p) => PerformerCard(performer: p)).toList(),
          ),
        ],
      ),
    );
  }
}
