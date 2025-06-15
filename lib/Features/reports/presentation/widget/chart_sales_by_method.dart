import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'report_card_wrapper.dart';

class ChartSalesByMethod extends StatelessWidget {
  const ChartSalesByMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ReportCardWrapper(
        title: 'Sales by Payment Method',
        //subtitle: 'Last 30 days',
        child: Row(
          children: [
            // Pie Chart
            Expanded(
              flex: 3,
              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 40,
                  sectionsSpace: 4,
                  sections: [
                    PieChartSectionData(
                      color: const Color(0xFFE57373),
                      value: 40,
                      radius: 30,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      color: const Color(0xFFAED581),
                      value: 35,
                      radius: 30,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      color: const Color(0xFF4DB6AC),
                      value: 25,
                      radius: 30,
                      showTitle: false,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 32),

            // Legend
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  _LegendItem(color: Color(0xFFE57373), label: 'cash'),
                  SizedBox(height: 12),
                  _LegendItem(color: Color(0xFFAED581), label: 'Credit card'),
                  SizedBox(height: 12),
                  _LegendItem(color: Color(0xFF4DB6AC), label: 'installment'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 10),
        Text(label, style: const TextStyle(fontSize: 16, color: Colors.black54)),
      ],
    );
  }
}
