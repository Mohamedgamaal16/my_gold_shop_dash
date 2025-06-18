import 'dart:ui';

class MerchantModelDetail {
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

  final String id;
  final String ownerName;
  final String phone;
  final String registerDate;
  final String email;
  final String location;
  final String city;
  final String crNumber;
  final String crExpiryDate;

  final String nationalID;
  final String commercialRegister;
  final String freelancerDocument;
  final String investmentLicense;
  final String storePhotoOutside;
  final String storePhotoInside;
  final String code700;
  final String unifiedNationalNumber;

  final List<String> additionalAttachments;

  MerchantModelDetail({
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

    required this.id,
    required this.ownerName,
    required this.phone,
    required this.registerDate,
    required this.email,
    required this.location,
    required this.city,
    required this.crNumber,
    required this.crExpiryDate,

    required this.nationalID,
    required this.commercialRegister,
    required this.freelancerDocument,
    required this.investmentLicense,
    required this.storePhotoOutside,
    required this.storePhotoInside,
    required this.code700,
    required this.unifiedNationalNumber,

    this.additionalAttachments = const [],
  });
}
