import 'package:flutter/material.dart';

import '../../../../core/styles/text_styles.dart';
import '../../../payment_management/presantation/screen/widget/search_dropdown_filter.dart';
import '../widget/add_new_agent_widget.dart';

class DeliveryPersonnelBody extends StatelessWidget {
  const DeliveryPersonnelBody({super.key});

  @override
  Widget build(BuildContext context) {
    String searchQuery = '';
    String selectedFilter = 'Last 30 Days';

    final List<String> filterOptions = [
      'Last 7 Days',
      'Last 30 Days',
      'Last 3 Months',
      'Last Year',
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 25.0 ,left: 25),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: Text(
                  'Delivery Management',
                  style: AppTextStyles.heading3(context).copyWith(
                    color: Color(0xFF0D2E2B),
                  ),
                ),
              ),

              AddNewAgentButton(
                label: 'Add New Agent',
                onPressed: () {
                },
              ),

            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SearchDropdownFilter(
            dropdownItems: filterOptions,
            selectedItem: selectedFilter,
            onDropdownChanged: (String? value) {
              if (value != null) {
                // setState(() {
                // //  selectedFilter = value;
                // });
              }
            },
            onSearch: (String query) {
              // setState(() {
              //  // searchQuery = query;
              // });
            },
          ),
        ),
      ],
    );
  }
}
