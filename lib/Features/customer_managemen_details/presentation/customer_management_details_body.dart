import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/customer_managemen_details/presentation/widget/customer_order_card.dart';
import 'package:my_gold_dashboard/Features/payment_management/presantation/screen/widget/custom_search_field.dart';

class CustomerManagementDetailsBody extends StatefulWidget {
  const CustomerManagementDetailsBody({super.key, required this.customerId});

  final String customerId;

  @override
  State<CustomerManagementDetailsBody> createState() => _CustomerManagementDetailsBodyState();
}

class _CustomerManagementDetailsBodyState extends State<CustomerManagementDetailsBody> {
  final List<Map<String, dynamic>> _allOrders = [
    {
      'Customer Name': 'AL-kawani',
      'Customer ID': 'CUST-001',
      'Order ID': 'ORD-87652',
      'Received Date': 'Apr 20, 2025',
      'Payment Method': 'Cash',
      'Delivery Name': 'Ahmed Ali',
      'Merchant Name': 'Al-Saab Jewelry',
      'Product': 'Gold Ring',
      'Reason': 'The Product Was damaged during Shipping, and we sincerely apologize for the inconvenience caused',
      'Images': [
        'https://via.placeholder.com/50',
        'https://via.placeholder.com/50',
      ],
    },
    {
      'Customer Name': 'AL-kawani',
      'Customer ID': 'CUST-001',
      'Order ID': 'ORD-98765',
      'Received Date': 'Apr 22, 2025',
      'Payment Method': 'Cash',
      'Delivery Name': 'Ahmed Ali',
      'Merchant Name': 'Al-Saab Jewelry',
      'Product': 'Gold Ring',
      'Reason': 'The Product Was damaged during Shipping, and we sincerely apologize for the inconvenience caused',
      'Images': [
        'https://via.placeholder.com/50',
      ],
    },
  ];

  List<Map<String, dynamic>> _filteredOrders = [];

  @override
  void initState() {
    super.initState();
    _filteredOrders = _allOrders
        .where((order) => order['Customer ID'] == widget.customerId)
        .toList();
  }

  void _searchOrders(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      _filteredOrders = _allOrders.where((order) {
        final orderId = order['Order ID'].toString().toLowerCase();
        return order['Customer ID'] == widget.customerId && orderId.contains(lowerQuery);
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
          // Search Box
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: CustomSearchField(
              onSearch: _searchOrders,
              hintText: 'Search for order id',
            ),
          ),

          const SizedBox(height: 10),

          ..._filteredOrders.map((order) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomerOrderCard(
              customerName: order['Customer Name'],
              customerId: order['Customer ID'],
              orderId: order['Order ID'],
              receivedDate: order['Received Date'],
              paymentMethod: order['Payment Method'],
              deliveryName: order['Delivery Name'],
              merchantName: order['Merchant Name'],
              product: order['Product'],
              reason: order['Reason'],
              imageUrls: List<String>.from(order['Images']),
            ),
          )),
        ],
      ),
    );
  }
}