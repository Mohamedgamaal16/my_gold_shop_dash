import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class GenericDataTable extends StatelessWidget {
  const GenericDataTable({
    super.key,
    required this.columns,
    required this.source,
    this.height = 372,
    this.width = 800, // Back to required double with default
    this.rowsPerPage = 5,
    this.currentPage = 0,
  });

  final List<String> columns;
  final DataTableSource source;
  final double height;
  final double width; // Back to required double
  final int rowsPerPage;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    debugPrint("Column Count: ${columns.length}");
    final startIndex = currentPage * rowsPerPage;
    final endIndex = (startIndex + rowsPerPage).clamp(
      0,
      source.rowCount,
    );

    return Container(
      height: height,
      width: width, // Use the provided width
      decoration: BoxDecoration(
        color: AppColors.colorsSurface,
        borderRadius: BorderRadius.circular(15),
        border: const Border.fromBorderSide(
          BorderSide(width: 0.5, color: AppColors.colorsText),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: DataTable2(
              columnSpacing: 12,
              empty: const SizedBox(),
              horizontalMargin: 12,
              fixedColumnsColor: AppColors.colorsSurface,
              dataTextStyle: AppTextStyles.bodyS(context),
              // Remove minWidth to prevent conflicts with fixed width
              columns: columns
                  .map(
                    (column) => DataColumn2(
                      label: Text(
                        column,
                        style: AppTextStyles.bodyM(context),
                        overflow: TextOverflow.ellipsis,
                      ),
                      size: ColumnSize.L,
                      headingRowAlignment: MainAxisAlignment.center,
                    ),
                  )
                  .toList(),
              rows: List.generate(
                endIndex - startIndex,
                (index) => source.getRow(startIndex + index)!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}