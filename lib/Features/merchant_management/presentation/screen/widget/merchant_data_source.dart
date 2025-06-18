import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/merchant_management/presentation/screen/widget/status_badge.dart';

import 'merchant_model.dart';

class MerchantDataSource extends DataTableSource {
  MerchantDataSource({
    required this.context,
    required this.data,
    this.onSuspend,
    this.onUnsuspend,
    this.onRemove,
  });

  final BuildContext context;
  final List<MerchantModel> data;
  final void Function(MerchantModel)? onSuspend;
  final void Function(MerchantModel)? onUnsuspend;
  final void Function(MerchantModel)? onRemove;

  @override
  @override
  DataRow? getRow(int index) {
    if (index < 0 || index >= data.length) {
      return const DataRow(cells: []); // يمنع الخطأ عند التنقل للصفحات الفارغة
    }

    final merchant = data[index];

    return DataRow(
      cells: [
        DataCell(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(merchant.name, style: const TextStyle(fontWeight: FontWeight.w600)),
            Text(merchant.subName, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        )),

        DataCell(StatusBadge(status: merchant.verificationStatus)),

        DataCell(Text(merchant.date)),

        DataCell(Text(merchant.performance)),

        DataCell(Text(
          merchant.complains.toString(),
          style: const TextStyle(color: Colors.red),
        )),

        DataCell(GestureDetector(
          onTap: merchant.onViewDetails,
          child: const Text("View", style: TextStyle(decoration: TextDecoration.underline)),
        )),

        DataCell(Row(
          children: [
            ElevatedButton(
              onPressed: merchant.verificationStatus == "Suspended"
                  ? () => onUnsuspend?.call(merchant)
                  : () => onSuspend?.call(merchant),
              style: ElevatedButton.styleFrom(
                backgroundColor: merchant.verificationStatus == "Suspended"
                    ? Colors.green.shade200
                    : Colors.amber.shade200,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              child: Text(
                merchant.verificationStatus == "Suspended" ? "Unsuspend" : "Suspend",
                style: const TextStyle(fontSize: 12, color: Colors.black87),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton.icon(
              onPressed: () => onRemove?.call(merchant),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade100,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              icon: const Icon(Icons.delete, size: 14, color: Colors.red),
              label: const Text("Remove", style: TextStyle(fontSize: 12, color: Colors.red)),
            ),
          ],
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
