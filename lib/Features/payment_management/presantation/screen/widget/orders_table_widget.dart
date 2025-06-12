import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'order_model.dart';
import 'order_data_source.dart';

class OrdersTableWidget extends StatelessWidget {
  final List<String> allowedDates;
  final String searchQuery;

  const OrdersTableWidget({
    Key? key,
    required this.allowedDates,
    required this.searchQuery,
  }) : super(key: key);

  List<OrderModel> _getFilteredOrders() {
    final allOrders = _dummyOrders();

    return allOrders.where((order) {
      final matchesDate = allowedDates.isEmpty || allowedDates.contains(order.date);
      final matchesSearch = searchQuery.isEmpty ||
          order.orderId.toLowerCase().contains(searchQuery.toLowerCase()) ||
          order.shopName.toLowerCase().contains(searchQuery.toLowerCase()) ||
          order.customerName.toLowerCase().contains(searchQuery.toLowerCase()) ||
          order.paymentMethod.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesDate && matchesSearch;
    }).toList();
  }

  List<OrderModel> _dummyOrders() {
    return [
      OrderModel(orderId: '#ORD-78945', shopName: 'Al-Saab Jewelry', customerName: 'Mohammed Al-Farsi', date: 'Apr 30, 2025', amount: '12,500 SAR', paymentMethod: 'Cash'),
      OrderModel(orderId: '#ORD-78944', shopName: 'Gold Palace', customerName: 'Fatima Al-Sulaiman', date: 'Apr 29, 2025', amount: '8,750 SAR', paymentMethod: 'Credit Card'),
      OrderModel(orderId: '#ORD-78943', shopName: 'Al-Saab Jewelry', customerName: 'Abdullah Al-Otaibi', date: 'Apr 28, 2025', amount: '5,200 SAR', paymentMethod: 'Apple Pay'),
      OrderModel(orderId: '#ORD-78943', shopName: 'Royal Gold', customerName: 'Abdullah Al-Otaibi', date: 'Apr 28, 2025', amount: '5,200 SAR', paymentMethod: 'tabby'),
      OrderModel(orderId: '#ORD-78944', shopName: 'Gold Palace', customerName: 'Fatima Al-Sulaiman', date: 'Apr 29, 2025', amount: '8,750 SAR', paymentMethod: 'Credit Card'),
      OrderModel(orderId: '#ORD-78943', shopName: 'Al-Saab Jewelry', customerName: 'Abdullah Al-Otaibi', date: 'Apr 28, 2025', amount: '5,200 SAR', paymentMethod: 'Apple Pay'),
      OrderModel(orderId: '#ORD-78943', shopName: 'Royal Gold', customerName: 'Abdullah Al-Otaibi', date: 'Apr 28, 2025', amount: '5,200 SAR', paymentMethod: 'tabby'),
      OrderModel(orderId: '#ORD-78944', shopName: 'Gold Palace', customerName: 'Fatima Al-Sulaiman', date: 'Apr 29, 2025', amount: '8,750 SAR', paymentMethod: 'Credit Card'),
      OrderModel(orderId: '#ORD-78943', shopName: 'Al-Saab Jewelry', customerName: 'Abdullah Al-Otaibi', date: 'Apr 28, 2025', amount: '5,200 SAR', paymentMethod: 'Apple Pay'),
      OrderModel(orderId: '#ORD-78943', shopName: 'Royal Gold', customerName: 'Abdullah Al-Otaibi', date: 'Apr 28, 2025', amount: '5,200 SAR', paymentMethod: 'tabby'),
      OrderModel(orderId: '#ORD-78942', shopName: 'Golden Sands', customerName: 'Noura Al-Qahtani', date: 'Apr 27, 2025', amount: '18,900 SAR', paymentMethod: 'tabby'),
      OrderModel(orderId: '#ORD-78942', shopName: 'Royal Gold', customerName: 'Noura Al-Qahtani', date: 'Apr 27, 2025', amount: '18,900 SAR', paymentMethod: 'Credit Card'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final filteredOrders = _getFilteredOrders();
    final dataSource = OrderDataSource(filteredOrders);

    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: PaginatedDataTable2(
        columns: _buildColumns(),
        source: dataSource,
        columnSpacing: 16,
        horizontalMargin: 12,
        minWidth: 900,
        headingRowColor: const WidgetStatePropertyAll(Color(0xFF0D2E2B)),
        headingTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        dataRowHeight: 56,
        rowsPerPage: 6,
        showFirstLastButtons: true,
        border: TableBorder(
          horizontalInside: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );

  }

  List<DataColumn> _buildColumns() {
    return const [
      DataColumn(label: Center(child: Text('Order ID', ))),
      DataColumn(label: Center(child: Text('Shop Name'))),
      DataColumn(label: Center(child: Text('Customer Name'))),
      DataColumn(label: Center(child: Text('Date'))),
      DataColumn(label: Center(child: Text('Amount'))),
      DataColumn(label: Center(child: Text('Payment Method'))),
    ];
  }
}
