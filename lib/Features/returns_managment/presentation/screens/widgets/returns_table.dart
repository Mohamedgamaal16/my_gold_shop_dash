import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/returns_managment/data/model/ReturnData.dart';
import 'package:my_gold_dashboard/Features/returns_managment/presentation/screens/widgets/returns_data_source.dart';
import 'package:my_gold_dashboard/core/service/table_page_number.dart';
import 'package:my_gold_dashboard/core/shared_widget/generic_tables.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import '../../../../order_management/widgets/order_table_footer.dart';
import '../return_detailes_screen.dart';

class ReturnsTable extends StatefulWidget {
  const ReturnsTable({super.key, required this.rows});

  final List<ReturnData> rows;

  @override
  State<ReturnsTable> createState() => _ReturnsTableState();
}

class _ReturnsTableState extends State<ReturnsTable> {
  static const _rowsPerPage = 10;
  int _page = 0;
  final _hCtrl = ScrollController();

  int get _maxPage =>
      (widget.rows.length / _rowsPerPage).ceil().clamp(1, 9999) - 1;

  @override
  void dispose() {
    _hCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final start = _page * _rowsPerPage;
    final end = (start + _rowsPerPage).clamp(0, widget.rows.length);
    final pageRows = widget.rows.sublist(start, end);

    return Column(
      children: [
        Expanded(
          child: ScrollbarTheme(
            data: ScrollbarThemeData(
              crossAxisMargin: 4,
              thumbColor:
              WidgetStateProperty.all(AppColors.texturesHeadersTexture),
              trackColor:
              WidgetStateProperty.all(AppColors.greyScaleLightGrey),
            ),
            child: Scrollbar(
              controller: _hCtrl,
              thumbVisibility: true,
              trackVisibility: true,
              interactive: true,
              radius: const Radius.circular(0),
              thickness: 10,
              child: SingleChildScrollView(
                controller: _hCtrl,
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.sizeOf(context).width,
                    maxWidth: double.infinity,
                  ),
                  child: GenericDataTable(
                    columns: const [
                      'Return ID',
                      'Order ID',
                      'Customer Name',
                      'Reason',
                      'Merchant',
                      'Date',
                      'Order Pic',
                      'Status',
                      'Actions',
                    ],
                    rowsPerPage: _rowsPerPage,
                    width: 1200,
                    source: ReturnsDataSource(
                      context,
                      pageRows,
                      onViewDetails: (item) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ReturnDetailsPage(item: item),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (widget.rows.length > _rowsPerPage)
          PaginationFooter(
            startIndex: start,
            endIndex: end,
            rowCount: widget.rows.length,
            currentPage: _page,
            totalPages: _maxPage + 1,
            onPreviousPage: () =>
                setState(() => _page = (_page - 1).clamp(0, _maxPage)),
            onNextPage: () =>
                setState(() => _page = (_page + 1).clamp(0, _maxPage)),
            buildPageNumbers: () => buildPageNumbers(
              _maxPage + 1,
              _page,
                  (p) => setState(() => _page = p),
            ),
          ),
      ],
    );
  }
}
