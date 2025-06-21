import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/delivery_personnel/presantation/widget/delevery_table.dart';
import 'package:my_gold_dashboard/Features/returns_managment/widgets/returns_table.dart';

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
    return SingleChildScrollView(
      child: Column(
        spacing: 20,
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
          
            SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.8,
            width:  MediaQuery.sizeOf(context).width * 0.8,
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DeliveryPersonnelTable(),
            ))
        ],
      ),
    );
  }
}
