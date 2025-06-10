import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'order_model.dart';
import 'order_data_source.dart';

class OrdersTableWidget extends StatelessWidget {
  final List<String> allowedDates;

  const OrdersTableWidget({Key? key, required this.allowedDates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<OrderModel> allOrders = [
      OrderModel(orderId: '#ORD-78945', shopName: 'Al-Saab Jewelry', customerName: 'Mohammed Al-Farsi', date: 'Apr 30, 2025', amount: '12,500 SAR', paymentMethod: 'Cash'),
      OrderModel(orderId: '#ORD-78944', shopName: 'Gold Palace', customerName: 'Fatima Al-Sulaiman', date: 'Apr 29, 2025', amount: '8,750 SAR', paymentMethod: 'Credit Card'),
      OrderModel(orderId: '#ORD-78943', shopName: 'Al-Saab Jewelry', customerName: 'Abdullah Al-Otaibi', date: 'Apr 28, 2025', amount: '5,200 SAR', paymentMethod: 'Apple Pay'),
      OrderModel(orderId: '#ORD-78945', shopName: 'Al-Saab Jewelry', customerName: 'Mohammed Al-Farsi', date: 'Apr 30, 2025', amount: '12,500 SAR', paymentMethod: 'Cash'),
      OrderModel(orderId: '#ORD-78944', shopName: 'Gold Palace', customerName: 'Fatima Al-Sulaiman', date: 'Apr 29, 2025', amount: '8,750 SAR', paymentMethod: 'Credit Card'),
      OrderModel(orderId: '#ORD-78943', shopName: 'Al-Saab Jewelry', customerName: 'Abdullah Al-Otaibi', date: 'Apr 28, 2025', amount: '5,200 SAR', paymentMethod: 'Apple Pay'),
      OrderModel(orderId: '#ORD-78943', shopName: 'Royal Gold', customerName: 'Abdullah Al-Otaibi', date: 'Apr 28, 2025', amount: '5,200 SAR', paymentMethod: 'tabby'),
      OrderModel(orderId: '#ORD-78942', shopName: 'Golden Sands', customerName: 'Noura Al-Qahtani', date: 'Apr 27, 2025', amount: '18,900 SAR', paymentMethod: 'tabby'),
      OrderModel(orderId: '#ORD-78942', shopName: 'Royal Gold', customerName: 'Noura Al-Qahtani', date: 'Apr 27, 2025', amount: '18,900 SAR', paymentMethod: 'Credit Card'),
    ];

    final filteredOrders = allowedDates.isEmpty
        ? allOrders
        : allOrders.where((order) => allowedDates.contains(order.date)).toList();

    final OrderDataSource orderDataSource = OrderDataSource(filteredOrders);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double rowHeight = 56.0;
          final int minRowCount = 6;
          final int actualRowCount = filteredOrders.length;
          final double tableHeight = rowHeight * (actualRowCount < minRowCount ? minRowCount : actualRowCount) + 56; // + header height approx

          return SizedBox(
            height: tableHeight,
            child: PaginatedDataTable2(
              columns: const [
                DataColumn(label: Text('Order ID')),
                DataColumn(label: Text('Shop Name')),
                DataColumn(label: Text('Customer Name')),
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Amount')),
                DataColumn(label: Text('Payment Method')),
              ],
              source: orderDataSource,
              columnSpacing: 16,
              horizontalMargin: 12,
              minWidth: 800,
              headingRowColor: WidgetStatePropertyAll(Color(0xFF0D2E2B)),
              headingTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              rowsPerPage: filteredOrders.length < minRowCount ? minRowCount : filteredOrders.length,
              showFirstLastButtons: true,
            ),
          );
        },
      ),
    );
  }
}