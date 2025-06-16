enum ReportTypeEnum {
  revenueSummary('Revenue Summary'),
  detailedReport('Detailed Report');

  final String displayName;
  const ReportTypeEnum(this.displayName);
}


extension ReportTypeEnumExtension on ReportTypeEnum {
  String get displayName {
    switch (this) {
      case ReportTypeEnum.revenueSummary:
        return 'Revenue Summary';
      case ReportTypeEnum.detailedReport:
        return 'Detailed Report';
    }
  }
}
