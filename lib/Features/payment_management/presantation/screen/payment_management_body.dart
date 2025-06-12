import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/payment_management/presantation/screen/widget/finance_card.dart';
import 'package:my_gold_dashboard/Features/payment_management/presantation/screen/widget/search_dropdown_filter.dart';
import 'package:my_gold_dashboard/Features/payment_management/presantation/screen/widget/orders_table_widget.dart';

class PaymentManagementBody extends StatefulWidget {
  const PaymentManagementBody({super.key});

  @override
  State<PaymentManagementBody> createState() => _PaymentManagementBodyState();
}

class _PaymentManagementBodyState extends State<PaymentManagementBody> {
  String searchQuery = '';
  String selectedFilter = 'Last 30 Days';

  final List<String> filterOptions = [
    'Last 7 Days',
    'Last 30 Days',
    'Last 3 Months',
    'Last Year',
  ];

  List<String> get filteredOrderDates {
    switch (selectedFilter) {
      case 'Last 7 Days':
        return ['Apr 30, 2025', 'Apr 29, 2025'];
      case 'Last 30 Days':
        return [
          'Apr 30, 2025',
          'Apr 29, 2025',
          'Apr 28, 2025',
          'Apr 27, 2025'
        ];
      case 'Last 3 Months':
      case 'Last Year':
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Text(
              'Finances',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0D2E2B),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                FinanceCard(
                  title: 'Total Income',
                  amount: '12,000',
                  iconAsset: 'assets/icons/Total Revenue.svg',
                ),
                SizedBox(width: 16),
                FinanceCard(
                  title: 'Expenses',
                  amount: '4,500 ',
                  iconAsset: 'assets/icons/Refunds.svg',
                ),
                SizedBox(width: 16),
                FinanceCard(
                  title: 'Savings',
                  amount: '7,500',
                  iconAsset: 'assets/icons/Purity level.svg',
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
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: OrdersTableWidget(
              allowedDates: filteredOrderDates,
              searchQuery: searchQuery,
            ),
          ),

        ],
      ),
    );
  }
}