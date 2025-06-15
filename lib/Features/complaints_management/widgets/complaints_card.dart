import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/complaints_management/model/compaints_model.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class ComplaintCard extends StatelessWidget {
  final Complaint complaint;
  final VoidCallback? onTap;

  const ComplaintCard({super.key, required this.complaint, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xff80d7be00),

        border: const Border(
          left: BorderSide(color: AppColors.yellowColor, width: 4),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(0),
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
                              text: 'Complaint ${complaint.id}',
                              style: AppTextStyles.bodyL(context),
                            ),
                            const TextSpan(text: ' – '),
                            TextSpan(
                              text: complaint.customerName,
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const TextSpan(text: ' / '),
                            TextSpan(
                              text: complaint.type,
                              style:  AppTextStyles.bodyM(context),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Text(
                      complaint.timeAgo,
                      style: AppTextStyles.bodyS(
                        context,
                      ).copyWith(color: AppColors.greyScaleMediumGrey),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Text(
                  complaint.description,
                  style: AppTextStyles.bodyS(
                    context,
                  ).copyWith(color: AppColors.greyScaleMediumGrey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
