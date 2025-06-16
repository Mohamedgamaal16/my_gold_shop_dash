import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/merchant_management/presentation/screen/widget/merchant_data_table.dart';
import 'package:my_gold_dashboard/Features/merchant_management/presentation/screen/widget/search_dropdown_filter.dart';
import 'package:my_gold_dashboard/Features/payment_management/presantation/screen/widget/search_dropdown_filter.dart';

class MerchantManagementBody extends StatefulWidget {
  const MerchantManagementBody({super.key});

  @override
  State<MerchantManagementBody> createState() => _MerchantManagementBodyState();
}

class _MerchantManagementBodyState extends State<MerchantManagementBody> {
  String searchQuery = '';
  String selectedFilter = 'All Status';

  final List<String> filterOptions = [
    'All Status',
    'Pending',
    'Verified',
    'Rejected',
    'Suspended',
  ];


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Merchant Management',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0D2E2B),
              ),
            ),
          ),
          const SizedBox(height: 16),

          /// Search + Dropdown Filter
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: MerchantSearchDropdownFilter(
              dropdownItems: filterOptions,
              selectedItem: selectedFilter,
              onDropdownChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    selectedFilter = value;
                  });
                }
              },
              onSearch: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
              onFilterPressed: () {
                // Logic to apply filter
              },
            ),


          ),

          const SizedBox(height: 20),

          // /// Placeholder: جدول النتائج
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: Container(
          //     height: 300,
          //     width: double.infinity,
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       border: Border.all(color: Colors.grey.shade300),
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //     child: const Text(
          //       'Table will be here...',
          //       style: TextStyle(color: Colors.grey),
          //     ),
          //   ),
          // ),
          MerchantTable()
        ],
      ),
    );
  }
}
