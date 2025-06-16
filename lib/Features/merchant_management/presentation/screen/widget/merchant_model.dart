import 'dart:ui';

class MerchantModel {
  final String name;
  final String subName;
  final String merchantName;
  final String storeName;
  final String verificationStatus;
  final String date;
  final String performance;
  final int complains;
  final String verificationDetails;
  final String actions;
  final VoidCallback? onViewDetails;



  MerchantModel({
    required this.name,
    required this.subName,
    required this.merchantName,
    required this.storeName,
    required this.verificationStatus,
    required this.date,
    required this.performance,
    required this.complains,
    required this.verificationDetails,
    required this.actions,
    this.onViewDetails,
  });
}
