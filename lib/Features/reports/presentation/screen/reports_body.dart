import 'package:flutter/material.dart';
import '../widget/chart_monthly_sales.dart';
import '../widget/chart_platform_performance.dart';
import '../widget/chart_sales_by_method.dart';
import '../widget/chart_top_shops.dart';
import '../widget/filter_header.dart';
import '../widget/report_card_wrapper.dart';


class ReportsBody extends StatefulWidget {
  const ReportsBody({super.key});

  @override
  State<ReportsBody> createState() => _ReportsBodyState();
}

class _ReportsBodyState extends State<ReportsBody> {
  DateTime? _startDate;
  DateTime? _endDate;

  String? _selectedReportType = 'All Reports';

  final List<String> _reportTypes = [
    'All Reports',
    'Sales',
    'Refunds',
    'Complaints',
  ];

  void _applyFilter() {
    debugPrint('Start: $_startDate, End: $_endDate, Type: $_selectedReportType');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Reports and Insights',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0D2E2B),
            ),
          ),
          const SizedBox(height: 20),
          ReportsFilterHeader(
            startDate: _startDate,
            endDate: _endDate,
            selectedReportType: _selectedReportType ?? 'All Reports',
            reportTypes: _reportTypes,
            onStartDateChanged: (date) => setState(() => _startDate = date),
            onEndDateChanged: (date) => setState(() => _endDate = date),
            onReportTypeChanged: (type) => setState(() => _selectedReportType = type),
            onApplyFilter: _applyFilter,
          ),
          const SizedBox(height: 30),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.3,
            children: const [
              ReportCardWrapper(title: 'Sales by Method', child: ChartSalesByMethod()),
              ReportCardWrapper(title: 'Monthly Sales', child: ChartMonthlySales()),
              ReportCardWrapper(title: 'Top Shops', child: ChartTopShops()),
              ReportCardWrapper(title: 'Platform Performance', child: ChartPlatformPerformance()),
            ],
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
