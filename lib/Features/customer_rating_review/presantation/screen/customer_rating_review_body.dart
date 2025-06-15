import 'package:flutter/material.dart';
import '../widget/customer_rating_review_table.dart';
import 'package:my_gold_dashboard/Features/payment_management/presantation/screen/widget/search_dropdown_filter.dart';

class CustomerRatingReviewBody extends StatefulWidget {
  const CustomerRatingReviewBody({super.key});

  @override
  State<CustomerRatingReviewBody> createState() => _CustomerRatingReviewBodyState();
}

class _CustomerRatingReviewBodyState extends State<CustomerRatingReviewBody> {
  String searchQuery = '';
  String selectedFilter = 'All Ratings';

  final List<String> filterOptions = [
    'All Ratings',
    '5 Stars',
    '4 Stars',
    '3 Stars',
    '2 Stars',
    '1 Star',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Text(
              'Customer Ratings Review',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0D2E2B),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SearchDropdownFilter(
              dropdownItems: filterOptions,
              selectedItem: selectedFilter,
              onDropdownChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    selectedFilter = value;
                  });
                }
              },
              onSearch: (String query) {
                setState(() {
                  searchQuery = query;
                });
              },
              searchHintText: 'Search by Order ID or Customer Name',
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: CustomerRatingReviewTable(),
          ),
        ],
      ),
    );
  }
}
