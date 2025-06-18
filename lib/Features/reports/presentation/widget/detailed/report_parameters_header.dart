import 'package:flutter/material.dart';

class ReportParametersHeader extends StatelessWidget {
  final String dateRange;

  const ReportParametersHeader({super.key, required this.dateRange});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Report Parameters',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF0D2E2B),
            fontSize: 18,
          ),
        ),
        Text(
          dateRange,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
