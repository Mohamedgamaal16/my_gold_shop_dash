import 'package:flutter/material.dart';

class TopMerchantsDataTable extends StatelessWidget {
  const TopMerchantsDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {
        'merchant': 'Al–Saab Jewelry',
        'sales': '58,420 SAR',
        'orders': '142',
        'satisfaction': '90%',
      },
      {
        'merchant': 'Golden Touch',
        'sales': '42,150 SAR',
        'orders': '118',
        'satisfaction': '87%',
      },
      {
        'merchant': 'Royal Gems',
        'sales': '36,780 SAR',
        'orders': '95',
        'satisfaction': '85%',
      },
      {
        'merchant': 'Diamond District',
        'sales': '29,540 SAR',
        'orders': '82',
        'satisfaction': '82%',
      },
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
            headingRowAlignment: MainAxisAlignment.center,
            label: Center(child: Text('Merchant', style: centeredHeaderStyle)),
          ),
          DataColumn(
            headingRowAlignment: MainAxisAlignment.center,
            label: Center(child: Text('Sales', style: centeredHeaderStyle)),
          ),
          DataColumn(
            headingRowAlignment: MainAxisAlignment.center,
            label: Center(child: Text('Orders', style: centeredHeaderStyle)),
          ),
          DataColumn(
            headingRowAlignment: MainAxisAlignment.center,
            label: Center(child: Text('Satisfaction', style: centeredHeaderStyle)),
          ),
        ],
        rows: data.map((entry) {
          return DataRow(
            cells: [
              DataCell(centeredText(entry['merchant'].toString())),
              DataCell(columnDivider(entry['sales'].toString())),
              DataCell(columnDivider(entry['orders'].toString())),
              DataCell(columnDivider(entry['satisfaction'].toString())),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget centeredText(String text) {
    return Center(child: Text(text, textAlign: TextAlign.center));
  }

  Widget columnDivider(String text) {
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
        ),
      ),
    );
  }
}
