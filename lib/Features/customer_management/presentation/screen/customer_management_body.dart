import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_gold_dashboard/Features/customer_management/presentation/screen/widget/dynamic_orders_table.dart';
import 'package:my_gold_dashboard/Features/payment_management/presantation/screen/payment_management.dart';
import 'package:my_gold_dashboard/Features/payment_management/presantation/screen/widget/custom_search_field.dart';

import '../../../../core/routes/routes.dart';
import '../../../customer_managemen_details/presentation/customer_management_details.dart';

class CustomerManagementBody extends StatefulWidget {
  const CustomerManagementBody({super.key});

  @override
  State<CustomerManagementBody> createState() => _CustomerManagementBodyState();
}

class _CustomerManagementBodyState extends State<CustomerManagementBody> {
  final List<Map<String, dynamic>> _allCustomers = [
    {
      'Customer ID': 'CUST-001',
      'Customer Name': 'Al-Kawani',
      'Complaints': 0,
      'Refunds': 1,
      'Order History': 'VIEW',
    },
    {
      'Customer ID': 'CUST-002',
      'Customer Name': 'Abdullah Omar',
      'Complaints': 7,
      'Refunds': 3,
      'Order History': 'VIEW',
    },
    {
      'Customer ID': 'CUST-003',
      'Customer Name': 'Fatima Zahra',
      'Complaints': 0,
      'Refunds': 12,
      'Order History': 'VIEW',
    },
    {
      'Customer ID': 'CUST-004',
      'Customer Name': 'Mohammed Ali',
      'Complaints': 20,
      'Refunds': 14,
      'Order History': 'VIEW',
    },{
      'Customer ID': 'CUST-0012',
      'Customer Name': 'Fatima Zahra',
      'Complaints': 0,
      'Refunds': 12,
      'Order History': 'VIEW',
    },
    {
      'Customer ID': 'CUST-005',
      'Customer Name': 'Mohammed Ali',
      'Complaints': 20,
      'Refunds': 14,
      'Order History': 'VIEW',
    },{
      'Customer ID': 'CUST-007',
      'Customer Name': 'Fatima Zahra',
      'Complaints': 0,
      'Refunds': 12,
      'Order History': 'VIEW',
    },
    {
      'Customer ID': 'CUST-008',
      'Customer Name': 'Mohammed Ali',
      'Complaints': 20,
      'Refunds': 14,
      'Order History': 'VIEW',
    },
  ];

  List<Map<String, dynamic>> _filteredCustomers = [];

  @override
  void initState() {
    super.initState();
    _filteredCustomers = List.from(_allCustomers); // start with full list
  }

  void _searchCustomers(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      _filteredCustomers = _allCustomers.where((customer) {
        final name = customer['Customer Name'].toString().toLowerCase();
        final id = customer['Customer ID'].toString().toLowerCase();
        return name.contains(lowerQuery) || id.contains(lowerQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Text(
              'Customer Management',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0D2E2B),
              ),
            ),
          ),

          // Search Field
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: CustomSearchField(
              onSearch: _searchCustomers, // bind search
              hintText: 'Search by Customer Name or ID',
            ),
          ),

          const SizedBox(height: 24),

          // Table
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DynamicOrdersTable(
              rowData: _filteredCustomers,
              columnNames: const [
                'Customer ID',
                'Customer Name',
                'Complaints',
                'Refunds',
                'Order History'
              ],
              onViewPressed: (row) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CustomerManagementDetails(),
                  ),
                );

              },
            ),
          ),
        ],
      ),
    );
  }
}
