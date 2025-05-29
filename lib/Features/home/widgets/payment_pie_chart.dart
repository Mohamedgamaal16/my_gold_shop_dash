import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class PaymentPieChart extends StatefulWidget {
  const PaymentPieChart({super.key});

  @override
  State<PaymentPieChart> createState() => _PaymentPieChartState();
}

class _PaymentPieChartState extends State<PaymentPieChart> {
  String selected = "Daily";

  final List<Map<String, dynamic>> paymentData = [
    {'label': 'Cash', 'value': 44.0, 'color': Colors.orange},
    {'label': 'Credit', 'value': 33.0, 'color': Colors.green},
    {'label': 'Install', 'value': 23.0, 'color': Colors.indigo},
  ];

  @override
  Widget build(BuildContext context) {
    final data =
        paymentData
            .map(
              (item) => PieChartSectionData(
                color: item['color'],
                value: item['value'],
                title: '${item['label']}\n${item['value']}%',
                radius: 60,
                titleStyle: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            )
            .toList();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.colorsSurface),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Payment Methods",
                style: AppTextStyles.bodyL(
                  context,
                ).copyWith(fontWeight: FontWeight.w600),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children:
                      ["Daily", "Weekly", "Monthly"].map((option) {
                        final isSelected = option == selected;
                        return GestureDetector(
                          onTap: () => setState(() => selected = option),
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
                              option,
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

          // Pie Chart
          AspectRatio(
            aspectRatio: 1.6,
            child: PieChart(
              PieChartData(
                sections: data,
                sectionsSpace: 2,
                centerSpaceRadius: 40,
              ),
            ),
          ),

          // Legend
          Wrap(
            spacing: 24,
            runSpacing: 8,
            children:
                paymentData.map((item) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: item['color'],
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(item['label'], style: AppTextStyles.bodyS(context)),
                    ],
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
