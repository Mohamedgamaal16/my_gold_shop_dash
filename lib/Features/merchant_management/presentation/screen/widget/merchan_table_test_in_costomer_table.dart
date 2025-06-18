
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/service/table_page_number.dart';
import 'package:my_gold_dashboard/core/shared_widget/generic_tables.dart';
import '../../../../customer_rating_review/presantation/widget/CompactReviewDataTable.dart';
import '../../../../customer_rating_review/presantation/widget/customer_rating_review_model.dart';
import '../../../../order_management/widgets/order_table_footer.dart';


class MerchanTableTestInCostomerTable extends StatefulWidget {
  const MerchanTableTestInCostomerTable({super.key});

  @override
  State<MerchanTableTestInCostomerTable> createState() => _CustomerRatingReviewTableState();
}

class _CustomerRatingReviewTableState extends State<MerchanTableTestInCostomerTable> {
  final int _rowsPerPage = 8;
  int _currentPage = 0;
  final ScrollController _horizontalScrollController = ScrollController();
  late final _CustomerReviewDataSource _dataSource;

  @override
  void initState() {
    super.initState();
    _dataSource = _CustomerReviewDataSource(context, customerReviews);
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() => _currentPage--);
    }
  }

  void _nextPage() {
    final totalPages = (customerReviews.length / _rowsPerPage).ceil();
    if (_currentPage < totalPages - 1) {
      setState(() => _currentPage++);
    }
  }

  void _goToPage(int page) {
    setState(() => _currentPage = page);
  }

  @override
  Widget build(BuildContext context) {
    final int totalCount = customerReviews.length;
    final int startIndex = _currentPage * _rowsPerPage;
    final int endIndex = (startIndex + _rowsPerPage).clamp(0, totalCount);

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          child: ScrollbarTheme(
            data: ScrollbarThemeData(
              thumbColor: WidgetStateProperty.all(AppColors.texturesHeadersTexture),
              trackColor: WidgetStateProperty.all(AppColors.greyScaleLightGrey),
            ),
            child: Scrollbar(
              controller: _horizontalScrollController,
              thumbVisibility: true,
              trackVisibility: true,
              interactive: true,
              thickness: 10,
              child: SingleChildScrollView(
                controller: _horizontalScrollController,
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                    maxWidth: double.infinity,
                  ),
                  child: CompactReviewDataTable(
                    columns: const [
                      'Order ID',
                      'Customer Name',
                      'Rating',
                      'Comment',
                    ],
                    source: _dataSource,
                    rowsPerPage: _rowsPerPage,
                    width: 1200,
                    currentPage: _currentPage,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        if (totalCount > _rowsPerPage)
          PaginationFooter(
            startIndex: startIndex,
            endIndex: endIndex,
            rowCount: totalCount,
            currentPage: _currentPage,
            totalPages: (totalCount / _rowsPerPage).ceil(),
            onPreviousPage: _previousPage,
            onNextPage: _nextPage,
            buildPageNumbers: () => buildPageNumbers(
              (totalCount / _rowsPerPage).ceil(),
              _currentPage,
              _goToPage,
            ),
          ),
      ],
    );
  }
}

class _CustomerReviewDataSource extends DataTableSource {
  final BuildContext context;
  final List<CustomerReviewModel> reviews;

  _CustomerReviewDataSource(this.context, this.reviews);

  @override
  DataRow? getRow(int index) {
    if (index < 0 || index >= reviews.length) return null;
    final item = reviews[index];
    return DataRow(
      cells: [
        DataCell(Center(child: Text(item.orderId))),
        DataCell(Center(child: Text(item.customerName))),
        DataCell(
          Center(
            child: RatingBarIndicator(
              rating: item.rating,
              itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
              itemCount: 5,
              itemSize: 18.0,
              direction: Axis.horizontal,
            ),
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 320),
            child: Text(
              item.comment,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => reviews.length;

  @override
  int get selectedRowCount => 0;
}