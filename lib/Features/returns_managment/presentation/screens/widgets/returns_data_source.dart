// returns_data_source.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_gold_dashboard/core/shared_widget/caches_image.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

import '../../../data/model/ReturnData.dart';
import '../return_detailes_screen.dart';

class ReturnsDataSource extends DataTableSource {
  ReturnsDataSource(
      this.context,
      this.rows, {
        this.onAccept,
        this.onRefuse,
        this.onViewDetails,
      });

  final BuildContext context;
  final List<ReturnData> rows;
  final void Function()? onAccept;
  final void Function()? onRefuse;
  final void Function(ReturnData item)? onViewDetails;

  @override
  DataRow? getRow(int index) {
    final item = rows[index];

    return DataRow(cells: [
      DataCell(Center(child: Text('RET-${item.returnCode}'))),
      DataCell(Center(child: Text('ORD-${item.orderCode}'))),
      DataCell(Center(child: Text(item.name ?? '-'))),
      DataCell(Center(child: Text(item.reason ?? '-'))),
      DataCell(Center(child: Text(item.merchantName ?? '-'))),
      DataCell(
        Center(
          child: Text(
            item.createdAt != null
                ? DateFormat('MMM dd, yyyy')
                .format(DateTime.parse(item.createdAt!))
                : '-',
          ),
        ),
      ),
      // order pic
      DataCell(
        Center(
          child: GestureDetector(
            onTap: () => _showImageDialog(context, item.orderPic ?? ''),
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.greyScaleNearWhite,
                border: Border.all(color: AppColors.greyScaleCharcoalGrey),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.image,
                      size: 16, color: AppColors.greyScaleCharcoalGrey),
                  const SizedBox(width: 4),
                  Text('View Image',
                      style: AppTextStyles.bodyS(context)),
                ],
              ),
            ),
          ),
        ),
      ),
      // status
      DataCell(
        Center(
          child: Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration:
            BoxDecoration(color: _statusColor(item.status ?? '')),
            child: Text(
              item.status ?? '-',
              style: TextStyle(
                color: _statusTextColor(item.status ?? ''),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      // actions
      DataCell(
        Center(
          child: InkWell(
            onTap: () {
              if (onViewDetails != null) {
                onViewDetails!(item);
              } else {
                _navigateToDetailsPage(context, item);
              }
            },
            child: const Text(
              'View Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                color: AppColors.greyScaleAlmostBlack,
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'rejected':
        return AppColors.trafficLightColorsError;
      case 'approved':
        return AppColors.trafficLightColorsSuccess;
      case 'pending':
        return AppColors.lightYellosColor;
      default:
        return AppColors.lightGreenColor;
    }
  }

  Color _statusTextColor(String status) {
    return status.toLowerCase() == 'pending'
        ? Colors.black87
        : AppColors.colorsSurface;
  }

  void _showImageDialog(BuildContext context, String path) {
    if (path.isEmpty) return;
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedImage(
              imageUrl: path,
              fit: BoxFit.cover,
              width: MediaQuery.sizeOf(context).width * 0.5,
              height: MediaQuery.sizeOf(context).height * 0.5,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToDetailsPage(BuildContext context, ReturnData item) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ReturnDetailsPage(item: item),
      ),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => rows.length;

  @override
  int get selectedRowCount => 0;
}
