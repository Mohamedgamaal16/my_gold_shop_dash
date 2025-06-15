import 'package:flutter/material.dart';

import '../../../../core/styles/text_styles.dart';

class CustomerOrderCard extends StatelessWidget {
  final String customerName;
  final String customerId;
  final String orderId;
  final String receivedDate;
  final String paymentMethod;
  final String merchantName;
  final String product;
  final String deliveryName;
  final String reason;
  final List<String> imageUrls;

  const CustomerOrderCard({
    super.key,
    required this.customerName,
    required this.customerId,
    required this.orderId,
    required this.receivedDate,
    required this.paymentMethod,
    required this.merchantName,
    required this.product,
    required this.deliveryName,
    required this.reason,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.brown.shade200, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 20,
            runSpacing: 12,
            children: [
              SizedBox(width: 280, child: _buildPair(context, 'Customer Name:', customerName)),
              SizedBox(width: 280, child: _buildPair(context, 'Customer ID:', customerId)),
              SizedBox(width: 280, child: _buildPair(context, 'Order ID:', orderId)),
              SizedBox(width: 280, child: _buildPair(context, 'Received Date:', receivedDate)),

              SizedBox(width: 280, child: _buildPair(context, 'Merchant Name:', merchantName)),
              SizedBox(width: 280, child: _buildPair(context, 'Product:', product)),
              SizedBox(width: 280, child: _buildPair(context, 'Delivery Name:', deliveryName)),
              SizedBox(width: 280, child: _buildPair(context, 'Payment Method:', paymentMethod)),

            ],
          ),
          const SizedBox(height: 20),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Reason:',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  reason,
                  style:AppTextStyles.menuTabs(context).copyWith(
                    color: Color(0xFF184B46),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Order Image',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: imageUrls.map((url) {
                      return Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0D2E2B),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Image.asset(
                          "assets/idetity/Designed to Dazzle, Created with Care – The Lab-Grown Diamond Ring You Deserve💎💫.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ],

      ),
    );
  }

  Widget _buildPair(BuildContext context, String title, String value) {
    return SizedBox(
      width: 330,
      child: RichText(
        text: TextSpan(
          text: title,
          style: AppTextStyles.bodyS(context),
          children: [
            TextSpan(
              text: ' $value',
              style: AppTextStyles.menuTabs(context).copyWith(
                color: Color(0xFF184B46),
              ),
            ),
          ],
        ),
      ),
    );
  }
}