import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class AdminTableHeader extends StatelessWidget {
  const AdminTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: const BoxDecoration(
        color: Color(0xFFF9FAFB),
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB), width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'Name',
              style: AppTextStyles.bodyS(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Phone Number',
              style: AppTextStyles.bodyS(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Permission',
              style: AppTextStyles.bodyS(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Added On',
              style: AppTextStyles.bodyS(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Actions',
              style: AppTextStyles.bodyS(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
