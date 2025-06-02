import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class PaginationFooter extends StatelessWidget {
  final int startIndex;
  final int endIndex;
  final int rowCount;
  final int currentPage;
  final int totalPages;
  final VoidCallback? onPreviousPage;
  final VoidCallback? onNextPage;
  final List<Widget> Function() buildPageNumbers;

  const PaginationFooter({
    super.key,
    required this.startIndex,
    required this.endIndex,
    required this.rowCount,
    required this.currentPage,
    required this.totalPages,
    required this.onPreviousPage,
    required this.onNextPage,
    required this.buildPageNumbers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5, color: AppColors.colorsText),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Results info
          Text(
            'Showing ${startIndex + 1} to $endIndex of $rowCount Results',
            style: AppTextStyles.bodyS(context).copyWith(
              color: AppColors.colorsText,
            ),
          ),

          // Pagination controls
          Row(
            children: [
              // Previous button
              IconButton(
                onPressed: currentPage > 0 ? onPreviousPage : null,
                icon: const Icon(Icons.chevron_left),
                iconSize: 20,
                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                padding: EdgeInsets.zero,
                style: IconButton.styleFrom(
                  backgroundColor: currentPage > 0
                      ? Colors.transparent
                      : Colors.grey.shade100,
                  foregroundColor: currentPage > 0
                      ? AppColors.colorsText
                      : Colors.grey.shade400,
                ),
              ),

              const SizedBox(width: 8),

              // Page numbers
              Row(children: buildPageNumbers()),

              const SizedBox(width: 8),

              // Next button
              IconButton(
                onPressed: currentPage < totalPages - 1 ? onNextPage : null,
                icon: const Icon(Icons.chevron_right),
                iconSize: 20,
                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                padding: EdgeInsets.zero,
                style: IconButton.styleFrom(
                  backgroundColor: currentPage < totalPages - 1
                      ? Colors.transparent
                      : Colors.grey.shade100,
                  foregroundColor: currentPage < totalPages - 1
                      ? AppColors.colorsText
                      : Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
