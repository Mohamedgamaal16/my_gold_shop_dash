import 'package:flutter/material.dart';
import '../../../../core/styles/text_styles.dart';
import 'package:image_network/image_network.dart';

class CustomerOrderCard extends StatelessWidget {
  final String customerName;
  final String customerId;
  final String orderId;
  final String receivedDate;
  final String paymentMethod;
  final String merchantName;
  final String product;
  final String deliveryName;
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
              SizedBox(width: 280, child: _pair(context, 'Customer Name:', customerName)),
              SizedBox(width: 280, child: _pair(context, 'Customer ID:', customerId)),
              SizedBox(width: 280, child: _pair(context, 'Order ID:', orderId)),
              SizedBox(width: 280, child: _pair(context, 'Received Date:', receivedDate)),
              SizedBox(width: 280, child: _pair(context, 'Merchant Name:', merchantName)),
              SizedBox(width: 280, child: _pair(context, 'Product:', product)),
              SizedBox(width: 280, child: _pair(context, 'Delivery Name:', deliveryName)),
              SizedBox(width: 280, child: _pair(context, 'Payment Method:', paymentMethod)),
            ],
          ),
          const SizedBox(height: 20),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.end,
          //       children: [
          //         const Text('Order Image', style: TextStyle(fontWeight: FontWeight.w600)),
          //         const SizedBox(height: 8),
          //         Wrap(
          //           spacing: 8,
          //           children: imageUrls.map((url) {
          //             return Container(
          //               padding: const EdgeInsets.all(4),
          //               decoration: BoxDecoration(
          //                 color: const Color(0xFF0D2E2B),
          //                 borderRadius: BorderRadius.circular(6),
          //               ),
          //               child: Image.network(url, width: 50, height: 50, fit: BoxFit.cover),
          //             );
          //           }).toList(),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Order Image',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: imageUrls.map((url) {
                      return Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0D2E2B),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: ImageNetwork(
                          image: url,
                          width: 50,
                          height: 50,
                          duration: 500,
                          curve: Curves.easeIn,

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

  Widget _pair(BuildContext context, String title, String value) => RichText(
    text: TextSpan(
      text: title,
      style: AppTextStyles.bodyS(context),
      children: [
        TextSpan(
          text: ' $value',
          style: AppTextStyles.menuTabs(context).copyWith(color: const Color(0xFF184B46)),
        ),
      ],
    ),
  );
}
