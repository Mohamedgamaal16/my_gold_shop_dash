import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/reports/presentation/widget/detailed/report_metric_card.dart';
import 'package:my_gold_dashboard/Features/reports/presentation/widget/detailed/report_parameters_header.dart';
import 'package:my_gold_dashboard/Features/reports/presentation/widget/detailed/top_merchants_data_table.dart';

class ReportParametersContent extends StatelessWidget {
  const ReportParametersContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ReportParametersHeader(dateRange: 'April 1 – April 26, 2025'),
        SizedBox(height: 40),
        Row(
         // mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Expanded(child: ReportMetricCard(label: 'Total sales', value: '247,890 SAR')),
            SizedBox(width: 16),
            Expanded(child: ReportMetricCard(label: 'Total Orders', value: '1,342')),
            SizedBox(width: 16),
            Expanded(child: ReportMetricCard(label: 'Average Order Value', value: '184.72 SAR')),
          ],
        ),
        SizedBox(height: 20),
        Align(
            alignment: Alignment.centerLeft,
            child: Text('Top Performing Merchants',style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF0D2E2B),
              fontSize: 18,
            ),)),


        Row(
          children: [
            Expanded(child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child:  TopMerchantsDataTable(),
            )),
          ],
        ),
      ],
    );
  }
}
