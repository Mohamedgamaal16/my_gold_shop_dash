import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class OrdersFilterBar extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final List<String> statuses = ['All Status', 'Pending', 'Completed', 'Cancelled'];
  final String selectedStatus;
  final ValueChanged<String?> onStatusChanged;
  final VoidCallback onFilterPressed;

  OrdersFilterBar({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorsSurface,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Search Field
          Expanded(
            flex: 5,
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search by Order ID or Customer Name',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: AppColors.greyScaleNearWhite,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(0),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 18),
              ),
            ),
          ),
          const SizedBox(width: 12),
      
          // Status Dropdown
          Expanded(
            flex: 2,
            child: Container(
              height: 52,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(0),
                color:AppColors.colorsSurface,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedStatus,
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: onStatusChanged,
                  items: statuses.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: AppTextStyles.bodyM(context)),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
      
          // Filter Button
          SizedBox(
            height: 52,
            child: ElevatedButton.icon(
              onPressed: onFilterPressed,
              icon: Icon(Icons.filter_list, color:AppColors.colorsSurface),
              label: Text('Filter', style: AppTextStyles.bodyM(context).copyWith(color: AppColors.colorsSurface)),
              style: ElevatedButton.styleFrom(
                backgroundColor:AppColors.colorsPrimary2, // Dark green
                padding: const EdgeInsets.symmetric(horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
