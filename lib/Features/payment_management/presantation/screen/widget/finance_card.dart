import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/styles/text_styles.dart';

class FinanceCard extends StatelessWidget {
  final String title;
  final String amount;
  final String iconAsset;

  const FinanceCard({
    Key? key,
    required this.title,
    required this.amount,
    required this.iconAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    //  width: 490,
      //height: 196,
      height: MediaQuery.sizeOf(context).height * 0.3,
      width: MediaQuery.sizeOf(context).width * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF9CE1BA),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                iconAsset,
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "$amount SAR",
            style:  AppTextStyles.heading5(context)
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style:  AppTextStyles.subtitleM(context).copyWith(
              color: Color(0x5E0D2E2B)
            )),
        ],
      ),
    );
  }
}
