import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/enums/report_type_enum.dart';
import '../../../../core/routes/routes.dart';
import '../cubit/reports_details_cubit.dart';
import '../cubit/reports_details_state.dart';
import '../widget/detailed/report_parameters_content.dart';
import '../widget/detailed/revenue_summary_content.dart';

class DetailedReportScreen extends StatelessWidget {
  const DetailedReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<DetailedReportCubit, DetailedReportState>(
                builder: (context, state) {
                  final selectedType = ReportTypeEnum.values.firstWhere(
                        (type) => type.name == state.selectedReportType,
                    orElse: () => ReportTypeEnum.detailedReport,
                  );

                   return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedType.displayName,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0D2E2B),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Color(0xFF0D2E2B), size: 24),
                        tooltip: 'Close',
                        onPressed: () {
                          GoRouter.of(context)
                              .go(Routes.reports);
                        },
                      ),
                    ],
                  );
                },
              ),
          
              const SizedBox(height: 24),
          
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Date Range',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF0D2E2B),
                          ),
                        ),
                        const SizedBox(height: 8),
                        BlocBuilder<DetailedReportCubit, DetailedReportState>(
                          builder: (context, state) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xFFBDBDBD)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: DropdownButton<String>(
                                value: state.selectedDateRange,
                                isExpanded: true,
                                underline: const SizedBox(),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: dateRangeOptions.map((range) {
                                  return DropdownMenuItem(
                                    value: range,
                                    child: Text(range),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    context.read<DetailedReportCubit>().updateDateRange(value);
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
          
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Report Type',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF0D2E2B),
                          ),
                        ),
                        const SizedBox(height: 8),
                        BlocBuilder<DetailedReportCubit, DetailedReportState>(
                          builder: (context, state) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xFFBDBDBD)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: DropdownButton<String>(
                                value: state.selectedReportType,
                                isExpanded: true,
                                underline: const SizedBox(),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: ReportTypeEnum.values.map((type) {
                                  return DropdownMenuItem(
                                    value: type.name,
                                    child: Text(type.displayName),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    context.read<DetailedReportCubit>().updateReportType(value);
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          
              const SizedBox(height: 24),
          
              BlocBuilder<DetailedReportCubit, DetailedReportState>(
                builder: (context, state) {
                  if (state.selectedReportType == ReportTypeEnum.revenueSummary.name) {
                    return const RevenueSummaryContent();
                  } else {
                    return const ReportParametersContent(); // Placeholder
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const List<String> dateRangeOptions = [
  'Last 7 Days',
  'Last 30 Days',
  'Last 3 Months',
  'Last Year',
];
