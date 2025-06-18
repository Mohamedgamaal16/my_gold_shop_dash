import 'package:flutter/material.dart';

class RevenueDataTable extends StatelessWidget {
  const RevenueDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'month': 'January', 'revenue': '\$15,230.50', 'refund': '\$3,450.25', 'growth': 5.2},
      {'month': 'February', 'revenue': '\$17,850.75', 'refund': '\$4,120.50', 'growth': 17.2},
      {'month': 'March', 'revenue': '\$21,450.25', 'refund': '\$5,230.00', 'growth': 20.2},
      {'month': 'April', 'revenue': '\$19,780.50', 'refund': '\$11,880.25', 'growth': -7.8},
    ];

    const TextStyle centeredHeaderStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xFF0D2E2B),
      fontSize: 14,
      height: 1.3,
    );

    return Container(
      margin: const EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(6),
      ),
      child: DataTable(
        headingRowColor: WidgetStateProperty.all(const Color(0xFFF5F5F5)),
        dataRowMinHeight: 56,
        dataRowMaxHeight: 56,
        headingTextStyle: centeredHeaderStyle,
        columnSpacing: 0,
        columns: const [
          DataColumn(
            headingRowAlignment:  MainAxisAlignment.center,
            label: Center(child: Text('Month', style: centeredHeaderStyle)),
          ),
          DataColumn(
            headingRowAlignment:  MainAxisAlignment.center,
            label: Center(child: Text('Revenue', style: centeredHeaderStyle)),
          ),
          DataColumn(
            headingRowAlignment:  MainAxisAlignment.center,
            label: Center(child: Text('Refund', style: centeredHeaderStyle)),
          ),
          DataColumn(
            headingRowAlignment:  MainAxisAlignment.center,
            label: Center(child: Text('Growth', style: centeredHeaderStyle)),
          ),
        ],
        rows: data.map((entry) {
          final double growth = entry['growth'] as double;
          final bool isPositive = growth >= 0;
          final growthColor = isPositive ? Colors.green : Colors.red;

          return DataRow(
            cells: [
              DataCell(centeredText(entry['month'].toString())),
              DataCell(columnDivider(entry['revenue'].toString())),
              DataCell(columnDivider(entry['refund'].toString())),
              DataCell(columnDivider(
                '${growth > 0 ? '+' : ''}${growth.toStringAsFixed(1)}%',
                textColor: growthColor,
              )),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget centeredText(String text) {
    return Center(child: Text(text, textAlign: TextAlign.center));
  }

  Widget columnDivider(String text, {Color? textColor}) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: Color(0xFFE0E0E0), width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
