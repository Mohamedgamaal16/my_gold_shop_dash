import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/merchant_management/presentation/screen/widget/merchant_data_source.dart';
import 'package:my_gold_dashboard/core/shared_widget/generic_tables.dart';
import 'package:my_gold_dashboard/core/service/table_page_number.dart';

import '../../../../order_management/widgets/order_table_footer.dart';
import 'merchant_model.dart';

class MerchantTable extends StatefulWidget {
  const MerchantTable({super.key});

  @override
  State<MerchantTable> createState() => _MerchantTableState();
}

class _MerchantTableState extends State<MerchantTable> {
  final int _rowsPerPage = 6;
  int _currentPage = 0;

  final List<MerchantModel> sampleMerchants = [
    MerchantModel(
      name: 'Al-Saab Jewelry',
      subName: 'Al-Saab Jewelry',
      merchantName: 'Al-Saab',
      storeName: 'Al-Saab Jewelry',
      verificationStatus: 'Pending',
      date: '24/5/2025 - 3PM',
      performance: '-',
      complains: 10,
      verificationDetails: 'View',
      actions: '',
    ),
    MerchantModel(
      name: 'Golden Treasures',
      subName: 'Golden Treasures',
      merchantName: 'Golden',
      storeName: 'Golden Treasures',
      verificationStatus: 'Verified',
      date: '24/5/2025 - 3PM',
      performance: 'Good',
      complains: 10,
      verificationDetails: 'View',
      actions: '',
    ),MerchantModel(
      name: 'Golden Treasures',
      subName: 'Golden Treasures',
      merchantName: 'Golden',
      storeName: 'Golden Treasures',
      verificationStatus: 'Verified',
      date: '24/5/2025 - 3PM',
      performance: 'Good',
      complains: 10,
      verificationDetails: 'View',
      actions: '',
    ),MerchantModel(
      name: 'Golden Treasures',
      subName: 'Golden Treasures',
      merchantName: 'Golden',
      storeName: 'Golden Treasures',
      verificationStatus: 'Verified',
      date: '24/5/2025 - 3PM',
      performance: 'Good',
      complains: 10,
      verificationDetails: 'View',
      actions: '',
    ),MerchantModel(
      name: 'Golden Treasures',
      subName: 'Golden Treasures',
      merchantName: 'Golden',
      storeName: 'Golden Treasures',
      verificationStatus: 'Verified',
      date: '24/5/2025 - 3PM',
      performance: 'Good',
      complains: 10,
      verificationDetails: 'View',
      actions: '',
    ),MerchantModel(
      name: 'Golden Treasures',
      subName: 'Golden Treasures',
      merchantName: 'Golden',
      storeName: 'Golden Treasures',
      verificationStatus: 'Verified',
      date: '24/5/2025 - 3PM',
      performance: 'Good',
      complains: 10,
      verificationDetails: 'View',
      actions: '',
    ),MerchantModel(
      name: 'Golden Treasures',
      subName: 'Golden Treasures',
      merchantName: 'Golden',
      storeName: 'Golden Treasures',
      verificationStatus: 'Verified',
      date: '24/5/2025 - 3PM',
      performance: 'Good',
      complains: 10,
      verificationDetails: 'View',
      actions: '',
    ),MerchantModel(
      name: 'Golden Treasures',
      subName: 'Golden Treasures',
      merchantName: 'Golden',
      storeName: 'Golden Treasures',
      verificationStatus: 'Verified',
      date: '24/5/2025 - 3PM',
      performance: 'Good',
      complains: 10,
      verificationDetails: 'View',
      actions: '',
    ),MerchantModel(
      name: 'Golden Treasures',
      subName: 'Golden Treasures',
      merchantName: 'Golden',
      storeName: 'Golden Treasures',
      verificationStatus: 'Verified',
      date: '24/5/2025 - 3PM',
      performance: 'Good',
      complains: 10,
      verificationDetails: 'View',
      actions: '',
    ),
    // أضف الباقي بنفس الطريقة...
  ];

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
    final maxPage = (sampleMerchants.length / _rowsPerPage).ceil();
    if (_currentPage < maxPage - 1) {
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
    final int totalMerchants = sampleMerchants.length;
    final int startIndex = _currentPage * _rowsPerPage;
    final int endIndex =
    (startIndex + _rowsPerPage > totalMerchants) ? totalMerchants : startIndex + _rowsPerPage;

    final List<MerchantModel> paginatedData = sampleMerchants.sublist(startIndex, endIndex);

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            controller: _horizontalScrollController,
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
              ),
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
                  onSuspend: (merchant) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Merchant Suspended")),
                    );
                  },
                  onUnsuspend: (merchant) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Merchant Unsuspended")),
                    );
                  },
                  onRemove: (merchant) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Merchant Removed")),
                    );
                  },
                ),
                rowsPerPage: _rowsPerPage,
                currentPage: _currentPage,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        PaginationFooter(
          startIndex: startIndex,
          endIndex: endIndex,
          rowCount: totalMerchants,
          currentPage: _currentPage,
          totalPages: (totalMerchants / _rowsPerPage).ceil(),
          onPreviousPage: _previousPage,
          onNextPage: _nextPage,
          buildPageNumbers: () => buildPageNumbers(
            (totalMerchants / _rowsPerPage).ceil(),
            _currentPage,
            _goToPage,
          ),
        ),
      ],
    );
  }
}
