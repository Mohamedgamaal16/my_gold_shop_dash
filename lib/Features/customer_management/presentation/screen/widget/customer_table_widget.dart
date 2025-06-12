
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'customer_table_model.dart';

class CustomerTableWidget extends StatelessWidget {
  final List<CustomerTableModel> data;

  const CustomerTableWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: DataTable2(
        columns: const [
          DataColumn(label: Center(child: Text('Customer ID'))),
          DataColumn(label: Center(child: Text('Customer Name'))),
          DataColumn(label: Center(child: Text('Complaints'))),
          DataColumn(label: Center(child: Text('Refunds'))),
          DataColumn(label: Center(child: Text('Order History'))),
        ],
        rows: data.map((item) {
          return DataRow(cells: [
            DataCell(Center(child: Text(item.customerId))),
            DataCell(Center(child: Text(item.customerName))),
            DataCell(Center(child: Text(item.complaints.toString()))),
            DataCell(Center(child: Text(item.refunds.toString()))),
            DataCell(
              Center(
                child: TextButton(
                  onPressed: item.onViewHistory,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  ),
                  child: const Text(
                    'VIEW',
                    style: TextStyle(
                      color: Color(0xFF0D2E2B),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ]);
        }).toList(),
        columnSpacing: 12,
        horizontalMargin: 8,
        headingRowColor: WidgetStateProperty.all(const Color(0xFF0D2E2B)),
        headingTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        dataRowHeight: 56,
        headingRowHeight: 60,
        showBottomBorder: true,
        border: TableBorder.symmetric(
          inside: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
          outside: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
        ),
      ),
    );
  }
}
