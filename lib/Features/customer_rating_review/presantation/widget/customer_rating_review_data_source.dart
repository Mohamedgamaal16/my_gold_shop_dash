// ملف: customer_rating_review_data_source.dart

import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'customer_rating_review_model.dart';

class CustomerRatingReviewDataSource extends DataTableSource {
  final BuildContext context;
  final List<CustomerReviewModel> reviews;

  CustomerRatingReviewDataSource(this.context, this.reviews);

  @override
  DataRow? getRow(int index) {
    if (index >= reviews.length) return null;
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
              itemSize: 20.0,
              direction: Axis.horizontal,
            ),
          ),
        ),
        DataCell(
          Container(
            width: 300,
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