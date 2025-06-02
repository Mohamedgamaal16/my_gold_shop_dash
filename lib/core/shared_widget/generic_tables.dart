import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_gold_dashboard/Features/order_management/widgets/order_table_footer.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class GenericDataTable extends StatefulWidget {
  const GenericDataTable({
    super.key,
    required this.columns,
    required this.source,
    this.height = 372,
    this.width = 800,
    this.rowsPerPage = 5,
  });

  final List<String> columns;
  final DataTableSource source;
  final double height;
  final double width;
  final int rowsPerPage;

  @override
  State<GenericDataTable> createState() => _GenericDataTableState();
}

class _GenericDataTableState extends State<GenericDataTable> {
  int _currentPage = 0;
  late int _totalPages;

  @override
  void initState() {
    super.initState();
    _calculateTotalPages();
  }

  void _calculateTotalPages() {
    _totalPages = (widget.source.rowCount / widget.rowsPerPage).ceil();
  }

  void _goToPage(int page) {
    if (page >= 0 && page < _totalPages) {
      setState(() {
        _currentPage = page;
      });
    }
  }

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      setState(() {
        _currentPage++;
      });
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Column Count: ${widget.columns.length}");

    // Calculate the start and end indices for current page
    final startIndex = _currentPage * widget.rowsPerPage;
    final endIndex = (startIndex + widget.rowsPerPage).clamp(
      0,
      widget.source.rowCount,
    );

    return Container(
      height: widget.height,
      width: widget.width,
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
              isHorizontalScrollBarVisible: true,
              columnSpacing: 12,
              empty: const SizedBox(),
              horizontalMargin: 12,
              fixedColumnsColor: AppColors.colorsSurface,
              dataTextStyle: AppTextStyles.bodyS(context),
              minWidth: 600,
              columns:
                  widget.columns
                      .map(
                        (column) => DataColumn2(
                          label: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              column,
                              style: AppTextStyles.bodyM(context),
                            ),
                          ),
                          size: ColumnSize.L,
                          headingRowAlignment: MainAxisAlignment.center,
                        ),
                      )
                      .toList(),
              rows: List.generate(
                endIndex - startIndex,
                (index) => widget.source.getRow(startIndex + index)!,
              ),
            ),
          ),

          if (widget.source.rowCount > widget.rowsPerPage)
           PaginationFooter(
  startIndex: startIndex,
  endIndex: endIndex,
  rowCount: widget.source.rowCount,
  currentPage: _currentPage,
  totalPages: _totalPages,
  onPreviousPage: _previousPage,
  onNextPage: _nextPage,
  buildPageNumbers: buildPageNumbers,
),

        ],
      ),
    );
  }

  List<Widget> buildPageNumbers() {
    List<Widget> pageNumbers = [];

    // Calculate which pages to show
    int startPage = 0;
    int endPage = _totalPages - 1;

    // If we have more than 5 pages, show a subset
    if (_totalPages > 5) {
      if (_currentPage <= 2) {
        // Show first 3 pages
        startPage = 0;
        endPage = 2;
      } else if (_currentPage >= _totalPages - 3) {
        // Show last 3 pages
        startPage = _totalPages - 3;
        endPage = _totalPages - 1;
      } else {
        // Show current page and neighbors
        startPage = _currentPage - 1;
        endPage = _currentPage + 1;
      }
    }

    for (int i = startPage; i <= endPage; i++) {
      pageNumbers.add(
        GestureDetector(
          onTap: () => _goToPage(i),
          child: Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color:
                  i == _currentPage
                      ? AppColors
                          .colorsPrimary2 // Dark green for active page
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color:
                    i == _currentPage
                        ? AppColors.colorsPrimary2
                        : Colors.grey.shade300,
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                '${i + 1}',
                style: TextStyle(
                  color:
                      i == _currentPage
                          ? AppColors.colorsSurface
                          : AppColors.colorsText,
                  fontWeight:
                      i == _currentPage ? FontWeight.w600 : FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return pageNumbers;
  }
}


// GenericDataTable(
//                               columns: const [
//                                 'الاسم',
//                                 'رقم الهاتف',
//                                 'نوع الحساب'
//                               ],
//                               source:
//                                   DeliveryReportsDataSource(context, accounts),
//                               rowsPerPage: screenWidth < 600
//                                   ? 5
//                                   : 8, // Fewer rows on small screens
//                               width: screenWidth,
//                             ),








// class DeliveryReportsDataSource extends DataTableSource {
//   DeliveryReportsDataSource(this.context, this.accounts);

//   final BuildContext context;
//   final List<AdminModel> accounts;

//   @override
//   DataRow? getRow(int index) {
//     return DataRow(cells: [
//       DataCell(
//         GestureDetector(
//           onTap: () =>
//               context.go(Routes.accountDetails, extra: accounts[index]),
//           child: Center(
//             child: Text(
//               accounts[index].fullName!,
//             ),
//           ),
//         ),
//       ),
//       DataCell(
//         Center(
//           child: Text(
//             accounts[index].phoneNumber!,
//             style: const TextStyle(),
//           ),
//         ),
//       ),
//       DataCell(
//         Center(
//           child: Text(
//             accounts[index].previllige.name,
//           ),
//         ),
//       ),
//     ]);
//   }

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get rowCount => accounts.length;

//   @override
//   int get selectedRowCount => 0;
// }
