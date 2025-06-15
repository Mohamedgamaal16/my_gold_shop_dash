import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartPlatformPerformance extends StatelessWidget {
  const ChartPlatformPerformance({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Platform Performance',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D2E2B),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 2,
                      centerSpaceRadius: 40,
                      sections: _buildPieSections(),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _buildLegend(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildPieSections() {
    return [
      PieChartSectionData(
        color: Colors.blue,
        value: 40,
        title: '40%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.orange,
        value: 30,
        title: '30%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.green,
        value: 20,
        title: '20%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.redAccent,
        value: 10,
        title: '10%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    ];
  }

  Widget _buildLegend() {
    const legendStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        _LegendItem(color: Colors.blue, label: 'App'),
        _LegendItem(color: Colors.orange, label: 'Website'),
        _LegendItem(color: Colors.green, label: 'POS'),
        _LegendItem(color: Colors.redAccent, label: 'Other'),
      ],
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
        Container(width: 14, height: 14, color: color),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
