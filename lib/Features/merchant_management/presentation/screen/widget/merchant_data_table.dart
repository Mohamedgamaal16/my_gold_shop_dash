import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/service/table_page_number.dart';
import 'package:my_gold_dashboard/core/shared_widget/generic_tables.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import '../../../../order_management/widgets/order_table_footer.dart';
import 'merchant_data_source.dart';
import 'merchant_model.dart';

class MerchantTable extends StatefulWidget {
  const MerchantTable({super.key});

  @override
  State<MerchantTable> createState() => _MerchantTableState();
}

class _MerchantTableState extends State<MerchantTable> {
  final int _rowsPerPage = 8;
  int _currentPage = 0;
  final ScrollController _horizontalScrollController = ScrollController();

  final List<MerchantModel> merchants = sampleMerchants;

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  void _previousPage() {
    if (_currentPage > 0) setState(() => _currentPage--);
  }

  void _nextPage() {
    final maxPage = (merchants.length / _rowsPerPage).ceil();
    if (_currentPage < maxPage - 1) setState(() => _currentPage++);
  }

  void _goToPage(int page) => setState(() => _currentPage = page);

  @override
  Widget build(BuildContext context) {
    final total = merchants.length;
    final startIndex = _currentPage * _rowsPerPage;
    final endIndex = (startIndex + _rowsPerPage > total)
        ? total
        : startIndex + _rowsPerPage;

    final paginatedData = merchants.sublist(startIndex, endIndex);

    return Column(
      children: [
        SizedBox(
          height: _rowsPerPage * 58 + 60, // 58 = row height, 60 = header/padding
          width: MediaQuery.sizeOf(context).width,
          child: ScrollbarTheme(
            data: ScrollbarThemeData(
              thumbColor: WidgetStateProperty.all(AppColors.texturesHeadersTexture),
              trackColor: WidgetStateProperty.all(AppColors.greyScaleLightGrey),
            ),
            child: Scrollbar(
              controller: _horizontalScrollController,
              thumbVisibility: true,
              trackVisibility: true,
              thickness: 10,
              child: SingleChildScrollView(
                controller: _horizontalScrollController,
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: MediaQuery.sizeOf(context).width),
                  child: GenericDataTable(
                    columns: const [
                      "Merchant Name",
                      "Verification Status",
                      "Date",
                      "Performance",
                      "Complains",
                      "Verification Details",
                      "Actions",
                    ],
                    source: MerchantDataSource(
                      context: context,
                      data: paginatedData,
                      onSuspend: (m) => _snack('Suspended'),
                      onUnsuspend: (m) => _snack('Unsuspended'),
                      onRemove: (m) => _snack('Removed'),
                    ),
                    rowsPerPage: _rowsPerPage,
                    width: MediaQuery.sizeOf(context).width,
                    currentPage: _currentPage,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        if (total > _rowsPerPage)
          PaginationFooter(
            startIndex: startIndex,
            endIndex: endIndex,
            rowCount: total,
            currentPage: _currentPage,
            totalPages: (total / _rowsPerPage).ceil(),
            onPreviousPage: _previousPage,
            onNextPage: _nextPage,
            buildPageNumbers: () => buildPageNumbers(
              (total / _rowsPerPage).ceil(),
              _currentPage,
              _goToPage,
            ),
          ),
      ],
    );
  }

  void _snack(String action) => ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Merchant $action')),
  );
}

final List<MerchantModel> sampleMerchants = List.generate(
  12,
      (index) => MerchantModel(
    name: 'Merchant ${index + 1}',
    subName: 'Store ${index + 1}',
    merchantName: 'Merchant ${index + 1}',
    storeName: 'Store ${index + 1}',
    verificationStatus: index % 4 == 0
        ? 'Pending'
        : index % 4 == 1
        ? 'Verified'
        : index % 4 == 2
        ? 'Rejected'
        : 'Suspended',
    date: '24/5/2025 - 3PM',
    performance: index % 3 == 0
        ? '-'
        : index % 3 == 1
        ? 'Good'
        : 'Bad',
    complains: 10,
    verificationDetails: 'View',
    actions: '',
  ),
);
