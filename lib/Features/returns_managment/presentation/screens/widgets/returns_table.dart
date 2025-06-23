import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/order_management/widgets/order_managment_table_source.dart';
import 'package:my_gold_dashboard/Features/order_management/widgets/order_table_footer.dart';
import 'package:my_gold_dashboard/Features/returns_managment/presentation/screens/widgets/returns_data_source.dart';
import 'package:my_gold_dashboard/core/service/table_page_number.dart';
import 'package:my_gold_dashboard/core/shared_widget/generic_tables.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';

class ReturnsTable extends StatefulWidget {
  const ReturnsTable({super.key});

  @override
  State<ReturnsTable> createState() => _OrdersTableState();
}

class _OrdersTableState extends State<ReturnsTable> {
  final int _rowsPerPage = 6;
  int _currentPage = 0;

  final ScrollController _horizontalScrollController = ScrollController();

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
    }
  }

  void _nextPage() {
    if ((_currentPage + 1) * _rowsPerPage < orders.length) {
      setState(() {
        _currentPage++;
      });
    }
  }

  void _goToPage(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final int totalOrders = returnList.length;
    final int startIndex = _currentPage * _rowsPerPage;
    final int endIndex =
        ((startIndex + _rowsPerPage) > totalOrders)
            ? totalOrders
            : (startIndex + _rowsPerPage);
    final paginatedOrders = returnList.sublist(startIndex, endIndex);

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.5,
          width: MediaQuery.sizeOf(context).width,
          child: ScrollbarTheme(
            data: ScrollbarThemeData(
              crossAxisMargin:  4,
              thumbColor: WidgetStateProperty.all(AppColors.texturesHeadersTexture),
              trackColor: WidgetStateProperty.all(AppColors.greyScaleLightGrey),
            ),
            child: Scrollbar(
              controller: _horizontalScrollController,
              thumbVisibility: true,
              trackVisibility: true,
              interactive: true,
              radius: const Radius.circular(0),
              thickness: 10,
              child: SingleChildScrollView(
                controller: _horizontalScrollController,
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.sizeOf(context).width,
                    maxWidth: double.infinity,
                  ),
                  child: GenericDataTable(
                    columns: const [
                      "Return ID",
                      'Order ID',
                      'Customer Name',
                      'Reason',
                      'Merchant',
                      'Date',
                      'Order Pic',
                      'Status',
                      'Actions',
                    ],
                    source: RerturnsDataSource(
                      context,
                      paginatedOrders,
                      onAccept: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Order accepted'),
                            backgroundColor: AppColors.trafficLightColorsSuccess,
                          ),
                        );
                      },
                      onRefuse: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Order refused'),
                            backgroundColor: AppColors.trafficLightColorsError,
                          ),
                        );
                      },
                    ),
                    rowsPerPage: _rowsPerPage,
                    width: 1200,
                  ),
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),
        if (totalOrders > _rowsPerPage)
          PaginationFooter(
            startIndex: startIndex,
            endIndex: endIndex,
            rowCount: totalOrders,
            currentPage: _currentPage,
            totalPages: (totalOrders / _rowsPerPage).ceil(),
            onPreviousPage: _previousPage,
            onNextPage: _nextPage,
            buildPageNumbers: () => buildPageNumbers(
              (totalOrders / _rowsPerPage).ceil(),
              _currentPage,
              _goToPage,
            ),
          ),
      ],
    );
  }
}


