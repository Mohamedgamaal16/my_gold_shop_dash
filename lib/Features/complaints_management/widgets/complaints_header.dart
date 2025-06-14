import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/shared_widget/custom_text_field.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class ComplaintsHeader extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final List<String> statuses = [
    'All Status',
    'Pending',
    'Completed',
    'Cancelled',
  ];
  final String selectedStatus;
  final ValueChanged<String?> onStatusChanged;

  ComplaintsHeader({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorsBackground,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Text("Complaints Management", style: AppTextStyles.heading4(context).copyWith(fontWeight: FontWeight.bold)),
          SizedBox(width: 50),
          Expanded(
            flex: 5,
            child: CustomTextField(
              backColor: AppColors.colorsBackground,
              hintText: "search",
              controller: searchController,

              borderRadius: 0,
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
                color: AppColors.colorsBackground,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedStatus,
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: onStatusChanged,
                  items:
                      statuses.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: AppTextStyles.bodyM(context),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
