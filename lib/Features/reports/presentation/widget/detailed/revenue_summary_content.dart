import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/reports/presentation/widget/detailed/revenue_refund_legend.dart';
import 'package:my_gold_dashboard/Features/reports/presentation/widget/detailed/table_revenue_summary.dart';

import 'chart_revenue_summary.dart';

class RevenueSummaryContent extends StatelessWidget {
  const RevenueSummaryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ChartRevenueSummary(),
        SizedBox(height: 32),
        RevenueRefundLegend(),

        Row(
          children: [
            Expanded(child: Padding(
              padding: EdgeInsets.all(16.0),
              child: RevenueDataTable(),
            )),
          ],
        ),
      ],
    );
  }
}
