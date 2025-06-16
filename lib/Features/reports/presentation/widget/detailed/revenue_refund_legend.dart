import 'package:flutter/material.dart';

class RevenueRefundLegend extends StatelessWidget {
  const RevenueRefundLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _LegendItem(
          color: Colors.green,
          label: 'Revenue',
          lineColor: Color(0xFFAAF0AA),
        ),
        SizedBox(width: 40),
        _LegendItem(
          color: Colors.amber,
          label: 'Refund',
          lineColor: Color(0xFFF3E289),
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final Color lineColor;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 2,
          color: lineColor,
        ),
        Container(
          width: 16,
          height: 16,
          //margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),

        Container(
          width: 20,
          height: 2,
          color: lineColor,
         // margin: const EdgeInsets.only(left: 8),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(

            label,
            style: const TextStyle(

              fontSize: 16,
              color: Color(0xFF0D2E2B),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

      ],
    );
  }
}
