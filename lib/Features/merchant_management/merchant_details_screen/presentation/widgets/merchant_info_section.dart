import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';
import '../../../presentation/screen/widget/merchant_model.dart';
import '../model/mer_det_model.dart';

class MerchantInfoSection extends StatelessWidget {
  final MerchantModelDetail merchant;

  const MerchantInfoSection({super.key, required this.merchant});

  Widget _buildInfo(String label, String value, BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$label ',
        style: AppTextStyles.bodyS(context).copyWith(
          fontWeight:FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: AppTextStyles.bodyS(context).copyWith(

                color: const Color(0xFF184B46)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 50,
      runSpacing: 12,
      children: [
        _buildInfo("Merchant Name:", merchant.name, context),
       // SizedBox(width: 30,),
        _buildInfo("Merchant ID:", merchant.id, context),
        //SizedBox(width: 30,),
        _buildInfo("Owner Name:", merchant.ownerName, context),
       // SizedBox(width: 30,),
        _buildInfo("Phone Number:", merchant.phone, context),

        _buildInfo("Register On:", merchant.registerDate, context),
        _buildInfo("E-mail Merchant:", merchant.email, context),
        _buildInfo("Location:", merchant.location, context),
        _buildInfo("City:", merchant.city, context),
        _buildInfo("Commercial registration number", merchant.crNumber, context),
        _buildInfo("Commercial Register Expiry Date", merchant.crExpiryDate, context),
      ],
    );
  }
}
