import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartTopShops extends StatelessWidget {
  const ChartTopShops({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> shops = [
      'Diamond pendant',
      'Gold earrings',
      'Gold necklace',
      'Diamond ring',
    ];

    final List<double> sales = [21000, 24000, 28000, 33000];

    final List<BarChartGroupData> barGroups = List.generate(shops.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: sales[index],
            width: 18,
            borderRadius: BorderRadius.circular(4),
            color: const Color(0xFFE57373),
          ),
        ],
      );
    });

    return SizedBox(
      height: 300,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceBetween,
          barGroups: barGroups,
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  if (value.toInt() >= shops.length) return const SizedBox();
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      shops[value.toInt()],
                      style: const TextStyle(fontSize: 14, color: Color(0xFF0D2E2B)),
                    ),
                  );
                },
                reservedSize: 120,
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 10000,
                getTitlesWidget: (value, meta) {
                  return Text(
                    '${value.toInt()}',
                    style: const TextStyle(fontSize: 12, color: Color(0xFF0D2E2B)),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
