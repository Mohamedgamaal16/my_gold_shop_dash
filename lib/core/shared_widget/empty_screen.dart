// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:my_gold_dashboard/core/styles/text_styles.dart';
class EmptyWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final double? iconSize;

  const EmptyWidget({
    Key? key,
    this.title,
    this.subtitle,
    this.icon,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Empty box icon
          Container(
            width: iconSize ?? 80,
            height: iconSize ?? 80,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[400]!,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                // Main box
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[400]!,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                // Box flap/lid
                Positioned(
                  top: 0,
                  left: 8,
                  right: 8,
                  child: Container(
                    height: 16,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey[400]!,
                          width: 2,
                        ),
                        left: BorderSide(
                          color: Colors.grey[400]!,
                          width: 2,
                        ),
                        right: BorderSide(
                          color: Colors.grey[400]!,
                          width: 2,
                        ),
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                  ),
                ),
                // Center notch for the flap
                Positioned(
                  top: 0,
                  left: 32,
                  right: 32,
                  child: Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Main title
          Text(
            title ?? "لم نضف أي منتجات بعد",
            style: AppTextStyles.heading5(context).copyWith(
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 8),
          
          // Subtitle
          Text(
            subtitle ?? "ابدأ بإضافة منتج جديد!",
            style: AppTextStyles.bodyM(context).copyWith(
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}