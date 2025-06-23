import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/returns_managment/presentation/screens/widgets/returns_table.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

import '../../../payment_management/presantation/screen/widget/search_dropdown_filter.dart';


class ReturnsManagementScreenBody extends StatelessWidget {
  const ReturnsManagementScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    String searchQuery = '';
    String selectedFilter = 'Status';

    final List<String> filterOptions = [
      'Status',
      'Pending',
      'Approved',
      'Rejected',

    ];
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [

                  Text("Returns Management", style: AppTextStyles.heading4(context).copyWith(fontWeight: FontWeight.bold)),

      //  ReturnHeader(selectedStatus: 'Pending', onStatusChanged: (String? value) {  },),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SearchDropdownFilter(
            searchHintText: "Search by Order ID or Customer Name",
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
          height: MediaQuery.sizeOf(context).height * 0.85,
          child: ReturnsTable())
      ],
    );
  }
}