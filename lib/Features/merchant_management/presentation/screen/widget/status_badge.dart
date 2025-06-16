import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    switch (status.toLowerCase()) {
      case 'verified':
        bgColor = Colors.green;
        break;
      case 'pending':
        bgColor = Colors.orange;
        break;
      case 'rejected':
        bgColor = Colors.red;
        break;
      case 'suspended':
        bgColor = Colors.grey;
        break;
      default:
        bgColor = Colors.blueGrey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
