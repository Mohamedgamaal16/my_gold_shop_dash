import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'order_model.dart';

class OrderDataSource extends DataTableSource {
  final List<OrderModel> orders;

  OrderDataSource(this.orders);

  @override
  DataRow getRow(int index) {
    final order = orders[index];
    return DataRow(cells: [
      DataCell(Text(order.orderId, style: const TextStyle(fontWeight: FontWeight.bold))),
      DataCell(Text(order.shopName)),
      DataCell(Text(order.customerName)),
      DataCell(Text(order.date)),
      DataCell(Text(order.amount)),
      DataCell(Text(order.paymentMethod)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => orders.length;

  @override
  int get selectedRowCount => 0;
}
