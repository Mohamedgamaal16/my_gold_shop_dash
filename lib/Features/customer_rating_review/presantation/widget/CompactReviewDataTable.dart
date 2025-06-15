import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class CompactReviewDataTable extends StatelessWidget {
  const CompactReviewDataTable({
    super.key,
    required this.columns,
    required this.source,
    this.height = 420,
    this.width = 800,
    this.rowsPerPage = 5,
    this.currentPage = 0,
  });

  final List<String> columns;
  final DataTableSource source;
  final double height;
  final double width;
  final int rowsPerPage;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    debugPrint("[CompactReviewDataTable] Column Count: ${columns.length}");
    final startIndex = currentPage * rowsPerPage;
    final endIndex = (startIndex + rowsPerPage).clamp(0, source.rowCount);

    return Container(
      height: height,
      width: width,
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
              horizontalMargin: 0,
              dataRowHeight: 58,
              empty: const SizedBox(),
              fixedColumnsColor: AppColors.colorsSurface,
              dataTextStyle: AppTextStyles.bodyS(context),
              columns: columns.asMap().entries.map((entry) {
                final index = entry.key;
                final column = entry.value;
                final size = (column.toLowerCase().contains('comment'))
                    ? ColumnSize.L
                    : (column.toLowerCase().contains('name'))
                    ? ColumnSize.M
                    : ColumnSize.S;
                return DataColumn2(
                  label: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(width: 0.5, color: Colors.grey),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Align(
                      alignment: column.toLowerCase().contains('comment')
                          ? Alignment.centerLeft
                          : Alignment.center,
                      child: Text(
                        column,
                        style: AppTextStyles.bodyM(context),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  size: size,
                  headingRowAlignment: MainAxisAlignment.center,
                );
              }).toList(),
              rows: List.generate(
                endIndex - startIndex,
                    (index) {
                  final row = source.getRow(startIndex + index);
                  if (row == null) return const DataRow(cells: []);
                  return DataRow(
                    cells: row.cells.asMap().entries.map((entry) {
                      final isComment = columns[entry.key].toLowerCase().contains('comment');
                      final widget = entry.value.child;

                      if (isComment && widget is Text) {
                        return DataCell(
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(width: 0.5, color: Colors.grey),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            alignment: Alignment.centerLeft,
                            child: IntrinsicHeight(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: 400),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    widget.data ?? '',
                                    overflow: TextOverflow.ellipsis,
                                    style: widget.style,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return DataCell(
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(width: 0.5, color: Colors.grey),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            alignment: isComment ? Alignment.centerLeft : Alignment.center,
                            child: widget,
                          ),
                        );
                      }
                    }).toList(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
