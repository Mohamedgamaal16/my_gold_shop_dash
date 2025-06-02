import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/settings/model/admin_model.dart';
import 'package:my_gold_dashboard/Features/settings/widget/permission_badge.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class AdminRow extends StatelessWidget {
  final Admin admin;
  final VoidCallback onDelete;

  const AdminRow({super.key, required this.admin, required this.onDelete});

  String formatDate(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB), width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(admin.name, style: AppTextStyles.bodyS(context)),
          ),
          Expanded(
            flex: 2,
            child: Text(admin.phoneNumber, style: AppTextStyles.bodyS(context)),
          ),
          Expanded(
            flex: 2,
            child: PermissionBadge(permission: admin.permission),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "    ${formatDate(admin.addedOn)}",
              style: AppTextStyles.bodyS(context),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: onDelete,
              icon: const Icon(
                Icons.delete_outline,
                color: Color(0xFFEF4444),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
