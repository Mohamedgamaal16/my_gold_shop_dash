import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gold_dashboard/Features/reports/presentation/cubit/reports_details_state.dart';

import '../../../../core/enums/report_type_enum.dart';

class DetailedReportCubit extends Cubit<DetailedReportState> {
  DetailedReportCubit()
      : super(DetailedReportState(
    selectedDateRange: 'Last 30 Days',
    selectedReportType: ReportTypeEnum.revenueSummary.name,
  ));

  void updateDateRange(String newRange) {
    emit(state.copyWith(selectedDateRange: newRange));
  }

  void updateReportType(String newType) {
    emit(state.copyWith(selectedReportType: newType));
  }
}
