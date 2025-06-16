import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartRevenueSummary extends StatelessWidget {
  const ChartRevenueSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 8,
          minY: 0,
          maxY: 1000,
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 250,
                reservedSize: 40,
                getTitlesWidget: (value, meta) => Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: Text(
                    value.toInt().toString(),
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) => Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    value.toInt().toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            // Revenue Line (Green)
            LineChartBarData(
              isCurved: true,
              color: Colors.green,
              barWidth: 3,
              spots: const [
                FlSpot(0, 750),
                FlSpot(1, 650),
                FlSpot(2, 620),
                FlSpot(3, 700),
                FlSpot(4, 800),
                FlSpot(5, 900),
                FlSpot(6, 950),
                FlSpot(7, 860),
                FlSpot(8, 750),
              ],
              dotData: FlDotData(show: false),
            ),

            // Refund Line (Yellow)
            LineChartBarData(
              isCurved: true,
              color: Colors.amber,
              barWidth: 3,
              spots: const [
                FlSpot(0, 230),
                FlSpot(1, 270),
                FlSpot(2, 300),
                FlSpot(3, 350),
                FlSpot(4, 380),
                FlSpot(5, 360),
                FlSpot(6, 340),
                FlSpot(7, 370),
                FlSpot(8, 460),
              ],
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}