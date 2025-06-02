import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/settings/model/admin_model.dart';
import 'package:my_gold_dashboard/Features/settings/widget/admin_row.dart';
import 'package:my_gold_dashboard/Features/settings/widget/admin_table_header.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';

class AdminList extends StatelessWidget {
  final List<Admin> admins;
  final Function(int index) onDeleteAdmin;

  const AdminList({
    super.key,
    required this.admins,
    required this.onDeleteAdmin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorsSurface,
       
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const AdminTableHeader(),
          _buildAdminRows(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Text(
        'Current Admins',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1F2937),
        ),
      ),
    );
  }

  Widget _buildAdminRows() {
    if (admins.isEmpty) {
      return _buildEmptyState();
    }

    return Column(
      children: admins.asMap().entries.map((entry) {
        int index = entry.key;
        Admin admin = entry.value;
        return AdminRow(
          admin: admin,
          onDelete: () => onDeleteAdmin(index),
        );
      }).toList(),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(48),
      child: const Column(
        children: [
          Icon(
            Icons.people_outline,
            size: 64,
            color: Color(0xFF9CA3AF),
          ),
          SizedBox(height: 16),
          Text(
            'No Admins Found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B7280),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Add your first admin using the form above.',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF9CA3AF),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}