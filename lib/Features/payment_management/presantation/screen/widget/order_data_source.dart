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
      _centeredCell(order.orderId),
      _centeredCell(order.shopName),
      _centeredCell(order.customerName),
      _centeredCell(order.date),
      _centeredCell(order.amount),
      _centeredCell(order.paymentMethod),
    ]);
  }

  DataCell _centeredCell(String text) {
    return DataCell(
      Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 13),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => orders.length;

  @override
  int get selectedRowCount => 0;
}
