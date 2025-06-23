import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class DynamicOrdersTable extends StatelessWidget {
  final List<Map<String, dynamic>> rowData;
  final List<String>? columnNames;
  final double? tableHeight;
  final double? tableWidth;
  final Color? headerColor;
  final Color? rowColor;
  final bool showOuterBorder;
  final double rowHeight;
  final double headerHeight;
  final void Function(Map<String, dynamic>)? onViewPressed;

  const DynamicOrdersTable({
    Key? key,
    required this.rowData,
    this.columnNames,
    this.tableHeight,
    this.tableWidth,
    this.headerColor = const Color(0xFF0D2E2B),
    this.rowColor = Colors.white,
    this.showOuterBorder = true,
    this.rowHeight = 56,
    this.headerHeight = 60,
    this.onViewPressed,
  }) : super(key: key);

  List<String> _resolveColumnNames() {
    if (columnNames != null && columnNames!.isNotEmpty) return columnNames!;
    if (rowData.isNotEmpty) return rowData.first.keys.toList();
    return [];
  }

  List<DataColumn2> _buildColumns(BuildContext context, List<String> columns) {
    return columns
        .map(
          (name) => DataColumn2(
        label: Center(
          child: Text(
            name,
            style: AppTextStyles.heading5(context),
          ),
        ),
      ),
    )
        .toList();
  }

  List<DataRow2> _buildRows(BuildContext context, List<String> columns) {
    return rowData.map((dataRow) {
      final cells = columns.map((col) {
        if (col == 'Order History') {
          return DataCell(
            Center(
              child: GestureDetector(
                onTap: () => onViewPressed?.call(dataRow),
                child: Text(
                  'VIEW',
                  style: AppTextStyles.heading6(context).copyWith(
                   // color: const Color(0xFF0D2E2B),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          );
        }
        return DataCell(
          Center(
            child: Text(
              '${dataRow[col] ?? ''}',
              style: AppTextStyles.heading6(context),
            ),
          ),
        );
      }).toList();
      return DataRow2(cells: cells);
    }).toList();
  }

  double _calculateHeight(int rowsCount) {
    return tableHeight ??
        (headerHeight + rowHeight * rowsCount + 20);
  }

  @override
  Widget build(BuildContext context) {
    final columns = _resolveColumnNames();
    return SizedBox(
      height: _calculateHeight(rowData.length),
      width: tableWidth ?? double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: DataTable2(
          columns: _buildColumns(context, columns),
          rows: _buildRows(context, columns),
          columnSpacing: 12,
          horizontalMargin: 8,
          headingRowHeight: headerHeight,
          dataRowHeight: rowHeight,
          headingRowColor:
          WidgetStateProperty.all<Color>(headerColor!),
          dataRowColor: WidgetStateProperty.all<Color>(rowColor!),
          border: TableBorder.symmetric(
            inside: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
            outside: BorderSide(
              color: const Color(0xFFE0E0E0),
              width: showOuterBorder ? 1 : 0,
            ),
          ),
          headingTextStyle: AppTextStyles.heading5(context).copyWith(
            color: Colors.white,
fontWeight: FontWeight.w600
          ),
          showBottomBorder: true,
        ),
      ),
    );
  }
}
