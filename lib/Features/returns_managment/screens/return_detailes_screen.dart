import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/returns_managment/model/return_model.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class ReturnDetailsCard extends StatelessWidget {
  final ReturnModel returnModel;
  final VoidCallback? onApprove;
  final VoidCallback? onReject;

  const ReturnDetailsCard({
    super.key,
    required this.returnModel,
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
              Expanded(
                child: _buildInfoItem("Customer Name:", returnModel.customerName,context),
              ),
              Expanded(
                child: _buildInfoItem("Customer ID:", returnModel.customerId,context),
              ),
              Expanded(
                child: _buildInfoItem("Order ID:", returnModel.orderId,context),
              ),
              Expanded(
                child: _buildInfoItem("Return ID:", returnModel.returnId,context),
              ),
              Expanded(
                child: _buildInfoItem("Received Date:", returnModel.receivedDate,context),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Second Row
          Row(
            children: [
              Expanded(
                child: _buildInfoItem("Merchant Name:", returnModel.merchant,context),
              ),
              Expanded(
                child: _buildInfoItem("Product:", returnModel.product,context),
              ),
              Expanded(
                child: _buildInfoItem("Refund Date:", returnModel.refundDate,context),
              ),
              Expanded(
                child: _buildInfoItem("Delivery Name:", returnModel.deliveryName,context),
              ),
              Expanded(
                child: _buildInfoItem("Payment Method:", returnModel.paymentMethod,context),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Third Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Reason section (takes more space)
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reason:",
                      style: AppTextStyles.bodyM(context).copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      returnModel.reason,
                      style: AppTextStyles.bodyS(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              
              // Refund Status
              Expanded(
                child: _buildInfoItem("Refund Status:", returnModel.refundStatus,context),
              ),
              const SizedBox(width: 24),
              
              // Order Image
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Image",
                                        style: AppTextStyles.bodyL(context).copyWith(fontWeight: FontWeight.bold),

                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => _showImageDialog(context, returnModel.orderPic),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.colorsPrimary2,
                           
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          returnModel.orderPic,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: AppColors.colorsPrimary2,
                              child: const Icon(
                                Icons.image,
                                color:AppColors.colorsSurface,
                                size: 32,
                              ),
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: AppColors.colorsPrimary2,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color:AppColors.colorsSurface,
                                  strokeWidth: 2,
                                ),
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
                  foregroundColor:AppColors.colorsSurface,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 2,
                ),
                child:  Text(
                  "Approve",
                  style: AppTextStyles.buttonM(context),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: onReject,
                style: ElevatedButton.styleFrom(
                  backgroundColor:AppColors.colorsSurface,
                  foregroundColor: const Color(0xFFD32F2F),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFFD32F2F), width: 1),
                  ),
                  elevation: 1,
                ),
                child:  Text(
                  "Reject",
                                   style: AppTextStyles.buttonM(context),

                ),
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
        Text(
          label,
          style: AppTextStyles.bodyM(context).copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          value,
                    style: AppTextStyles.bodyS(context),

        ),
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
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          padding: const EdgeInsets.all(40),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.error_outline,
                                size: 64,
                                color: Colors.grey.shade600,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Failed to load image',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          padding: const EdgeInsets.all(40),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
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
                    child: const Icon(
                      Icons.close,
                      color:AppColors.colorsSurface,
                      size: 24,
                    ),
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
  final ReturnModel? returnModel;

  const ReturnDetailsPage({super.key, this.returnModel});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColors.colorsBackground,
      appBar: AppBar(
        title:  Text("Return Details",style: AppTextStyles.heading3(context),),
        backgroundColor: AppColors.colorsBackground,
        foregroundColor: AppColors.greyScaleAlmostBlack,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: ReturnDetailsCard(
          returnModel: returnModel!,
          onApprove: () {
            // Handle approve action
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Return ${returnModel!.returnId} approved successfully!"),
                backgroundColor: Colors.green,
              ),
            );
          },
          onReject: () {
            // Handle reject action
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Return ${returnModel!.returnId} rejected!"),
                backgroundColor: Colors.red,
              ),
            );
          },
        ),
      ),
    );
  }
}