import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../settings/widget/setting_appbar.dart';
import '../../../presentation/screen/widget/merchant_model.dart';
import '../model/mer_det_model.dart';
import '../widgets/merchant_attachments_grid.dart';
import '../widgets/merchant_info_section.dart';

class MerchantDetailBody extends StatelessWidget {
  final String merchantId;

  const MerchantDetailBody({super.key, required this.merchantId});

  @override
  Widget build(BuildContext context) {
    final merchant = MerchantModelDetail(
      name: "Al-Saab Jewelry",
      subName: "Al-Saab Jewelry",
      merchantName: "Al-Saab",
      storeName: "Al-Saab Jewelry",
      verificationStatus: "Pending",
      date: "24/5/2025 - 3PM",
      performance: "-",
      complains: 10,
      verificationDetails: "View",
      actions: "",
      onViewDetails: () {},

      id: merchantId,
      ownerName: "Mohamed Ibrahim",
      phone: "+201000000000",
      registerDate: "2024-05-10",
      email: "mohamed@example.com",
      location: "Cairo - Nasr City",
      city: "Cairo",
      crNumber: "CR-123456789",
      crExpiryDate: "2026-12-31",

      nationalID: 'assets/idetity/license.png',
      commercialRegister: 'assets/idetity/license.png',
      freelancerDocument: 'assets/idetity/license.png',
      investmentLicense: 'assets/idetity/license.png',
      storePhotoOutside: 'assets/idetity/license.png',
      storePhotoInside: 'assets/idetity/license.png',
      code700: 'assets/idetity/license.png',
      unifiedNationalNumber: 'assets/idetity/license.png',

      additionalAttachments: [],
    );

    final List<Map<String, String?>> attachments = [
      {'title': 'National ID', 'imagePath': merchant.nationalID},
      {'title': 'صورة السجل التجاري', 'imagePath': merchant.commercialRegister},
      {'title': 'صورة وثيقة ممارس حر', 'imagePath': merchant.freelancerDocument},
      {'title': 'صورة وثيقة ممارس حر', 'imagePath': merchant.freelancerDocument},
      {'title': 'صورة ترخيص وزارة الإستثمار', 'imagePath': merchant.investmentLicense},
      {'title': 'صورة المحل من الخارج', 'imagePath': merchant.storePhotoOutside},
      {'title': 'صورة المحل من الداخل', 'imagePath': merchant.storePhotoInside},
      {'title': 'صورة رقم ال700', 'imagePath': merchant.code700},
      {'title': 'صورة الرقم الوطني الموحد', 'imagePath': merchant.unifiedNationalNumber},
    ];

    return Scaffold(
      backgroundColor: AppColors.colorsBackground,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              width: 1200,
             // height: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Color(0xFFB99F6E), width: 0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MerchantInfoSection(merchant: merchant),
                  const SizedBox(height: 24),
                  MerchantAttachmentsGrid(attachments: attachments),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF184B46),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                          // textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        child: Text('Approve' ,style: AppTextStyles.subtitleS(context).copyWith(
                            color: Colors.white
                        ),),
                      ),

                      SizedBox(width: 16),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Color(0xFF7A1C1A),
                          backgroundColor: Color(0xFFF3D6D6),
                          side: BorderSide(color: Color(0xFF7A1C1A), width: 1.4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                          // textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        child: Text('Reject' ,style: AppTextStyles.subtitleS(context).copyWith(
                          color: Color(0xFF79000C),
                        ),),
                      ),

                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
