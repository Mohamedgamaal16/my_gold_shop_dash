// chart_monthly_sales.dart
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'report_card_wrapper.dart';

class ChartMonthlySales extends StatelessWidget {
  const ChartMonthlySales({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ReportCardWrapper(
        title: 'Monthly Sales Trends',
       // subtitle: 'Last 6 months',
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 50,
                  interval: 50000,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toInt().toString(),
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    final months = ['Nov', 'Dec', 'Jan', 'Feb', 'Mar', 'Apr'];
                    return Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        months[value.toInt() % months.length],
                        style: const TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(show: false),
            minX: 0,
            maxX: 5,
            minY: 0,
            maxY: 200000,
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 140000),
                  FlSpot(1, 110000),
                  FlSpot(2, 100000),
                  FlSpot(3, 160000),
                  FlSpot(4, 170000),
                  FlSpot(5, 130000),
                ],
                isCurved: true,
                color: const Color(0xFF326295),
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
                barWidth: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}