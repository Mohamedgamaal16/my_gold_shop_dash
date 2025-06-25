import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/returns_managment/data/model/ReturnData.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

import '../../data/model/return_model.dart';

import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';
import 'package:my_gold_dashboard/Features/returns_managment/data/model/ReturnData.dart';

class ReturnDetailsCard extends StatelessWidget {
  final ReturnData item;
  final VoidCallback? onApprove;
  final VoidCallback? onReject;

  const ReturnDetailsCard({
    super.key,
    required this.item,
    this.onApprove,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.colorsBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.colorsSecondary2, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Row
          Row(
            children: [
              Expanded(child: _buildInfoItem("Customer Name:", item.name ?? '-', context)),
            //  Expanded(child: _buildInfoItem("Customer ID:", item.customerId ?? '-', context)),
              Expanded(child: _buildInfoItem("Order ID:", 'ORD-${item.orderCode}', context)),
              Expanded(child: _buildInfoItem("Return ID:", 'RET-${item.returnCode}', context)),
             // Expanded(child: _buildInfoItem("Received Date:", item.receivedDate ?? '-', context)),
            ],
          ),
          const SizedBox(height: 16),

          // Second Row
          Row(
            children: [
              Expanded(child: _buildInfoItem("Merchant Name:", item.merchantName ?? '-', context)),
              // Expanded(child: _buildInfoItem("Product:", item.productName ?? '-', context)),
              // Expanded(child: _buildInfoItem("Refund Date:", item.refundDate ?? '-', context)),
              // Expanded(child: _buildInfoItem("Delivery Name:", item.deliveryName ?? '-', context)),
              // Expanded(child: _buildInfoItem("Payment Method:", item.paymentMethod ?? '-', context)),
            ],
          ),
          const SizedBox(height: 16),

          // Third Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Reason:",
                        style: AppTextStyles.bodyM(context).copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(item.reason ?? '-', style: AppTextStyles.bodyS(context)),
                  ],
                ),
              ),
              const SizedBox(width: 24),
             // Expanded(child: _buildInfoItem("Refund Status:", item.refundStatus ?? '-', context)),
              const SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order Image",
                      style: AppTextStyles.bodyL(context).copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => _showImageDialog(context, item.orderPic ?? ''),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(color: AppColors.colorsPrimary2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          item.orderPic ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: AppColors.colorsPrimary2,
                            child: const Icon(Icons.image, color: AppColors.colorsSurface, size: 32),
                          ),
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: AppColors.colorsPrimary2,
                              child: const Center(
                                child: CircularProgressIndicator(color: AppColors.colorsSurface),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: onApprove,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.colorsPrimary2,
                  foregroundColor: AppColors.colorsSurface,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 2,
                ),
                child: Text("Approve", style: AppTextStyles.buttonM(context)),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: onReject,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.colorsSurface,
                  foregroundColor: const Color(0xFFD32F2F),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFFD32F2F), width: 1),
                  ),
                  elevation: 1,
                ),
                child: Text("Reject", style: AppTextStyles.buttonM(context)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.bodyM(context).copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(value, style: AppTextStyles.bodyS(context)),
      ],
    );
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.8,
                    maxHeight: MediaQuery.of(context).size.height * 0.8,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      imagePath,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error_outline),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(Icons.close, color: AppColors.colorsSurface, size: 24),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}





class ReturnDetailsPage extends StatelessWidget {
  final ReturnData item;

  const ReturnDetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorsBackground,
      appBar: AppBar(
        title: Text("Return Details", style: AppTextStyles.heading3(context)),
        backgroundColor: AppColors.colorsBackground,
        foregroundColor: AppColors.greyScaleAlmostBlack,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Return ID: ${item.id}"),
            Text("Order ID: ${item.orderCode}"),
            Text("Reason: ${item.reason ?? '-'}"),
            Text("Customer: ${item.name ?? '-'}"),
            Text("Merchant: ${item.merchantName ?? '-'}"),
            ReturnDetailsCard(
              item: item,
              onApprove: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Return ${item.returnCode} approved successfully!"),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              onReject: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Return ${item.returnCode} rejected!"),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}