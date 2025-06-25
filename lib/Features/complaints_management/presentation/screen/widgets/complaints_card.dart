import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

import '../../../data/model/Complain.dart';

class ComplaintCard extends StatelessWidget {
  final Complain complain;
  final VoidCallback? onTap;

  const ComplaintCard({
    super.key,
    required this.complain,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final customerName =
    '${complain.userId?.firstName ?? ''} ${complain.userId?.secondName ?? ''}'
        .trim()
        .isEmpty
        ? '-'
        : '${complain.userId?.firstName ?? ''} ${complain.userId?.secondName ?? ''}';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
        color: Color(0xff80d7be00),
        border: Border(
          left: BorderSide(color: AppColors.yellowColor, width: 4),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: AppTextStyles.bodyM(context),
                          children: [
                            TextSpan(
                              text: 'Complaint #C${complain.complainCode ?? '-'}',
                              style: AppTextStyles.bodyL(context),
                            ),
                           // const TextSpan(text: ' – '),
                            TextSpan(
                              text: customerName,
                              style: const TextStyle(fontWeight: FontWeight.normal),
                            ),
                            const TextSpan(text: ' / '),
                            TextSpan(
                              text: complain.issue ?? '-',
                              style: AppTextStyles.bodyM(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      '',
                      style: AppTextStyles.bodyS(context)
                          .copyWith(color: AppColors.greyScaleMediumGrey),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  complain.description ?? '-',
                  style: AppTextStyles.bodyS(context)
                      .copyWith(color: AppColors.greyScaleMediumGrey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
