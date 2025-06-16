class DetailedReportState {
  final String selectedDateRange;
  final String selectedReportType;

  DetailedReportState({
    required this.selectedDateRange,
    required this.selectedReportType,
  });

  DetailedReportState copyWith({
    String? selectedDateRange,
    String? selectedReportType,
  }) {
    return DetailedReportState(
      selectedDateRange: selectedDateRange ?? this.selectedDateRange,
      selectedReportType: selectedReportType ?? this.selectedReportType,
    );
  }
}
