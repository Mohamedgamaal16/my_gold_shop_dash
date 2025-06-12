import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_gold_dashboard/Features/order_management/order/order_model.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';


List<Widget> buildPageNumbers(int totalPages, int currentPage, void Function(int) goToPage) {
  List<Widget> pageNumbers = [];

  int startPage = 0;
  int endPage = totalPages - 1;

  if (totalPages > 5) {
    if (currentPage <= 2) {
      startPage = 0;
      endPage = 2;
    } else if (currentPage >= totalPages - 3) {
      startPage = totalPages - 3;
      endPage = totalPages - 1;
    } else {
      startPage = currentPage - 1;
      endPage = currentPage + 1;
    }
  }

  for (int i = startPage; i <= endPage; i++) {
    pageNumbers.add(
      GestureDetector(
        onTap: () => goToPage(i),
        child: Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: i == currentPage ? AppColors.colorsPrimary2 : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: i == currentPage ? AppColors.colorsPrimary2 : Colors.grey.shade300,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              '${i + 1}',
              style: TextStyle(
                color: i == currentPage ? AppColors.colorsSurface : AppColors.colorsText,
                fontWeight: i == currentPage ? FontWeight.w600 : FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }

  return pageNumbers;
}

  
  



List<OrderModel> orders = [
  OrderModel(
    orderId: '#1234',
    customerName: 'Ahmed Al-Sulaiman',
    paymentMethod: 'Cash on Delivery',
    merchant: 'Al-Saab Jewelry',
    product: '100g Gold Bar',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Emergency',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),  OrderModel(
    orderId: '#1234',
    customerName: 'Ahmed Al-Sulaiman',
    paymentMethod: 'Cash on Delivery',
    merchant: 'Al-Saab Jewelry',
    product: '100g Gold Bar',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Emergency',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),  OrderModel(
    orderId: '#1234',
    customerName: 'Ahmed Al-Sulaiman',
    paymentMethod: 'Cash on Delivery',
    merchant: 'Al-Saab Jewelry',
    product: '100g Gold Bar',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Emergency',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),  OrderModel(
    orderId: '#1234',
    customerName: 'Ahmed Al-Sulaiman',
    paymentMethod: 'Cash on Delivery',
    merchant: 'Al-Saab Jewelry',
    product: '100g Gold Bar',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Emergency',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
  OrderModel(
    orderId: '#1235',
    customerName: 'Fatima Al-Rashid',
    paymentMethod: 'Credit Card',
    merchant: 'Gold Palace',
    product: 'Gold Necklace',
    orderDate: '24/5/2025 - 3PM',
    orderState: 'Schedule',
  ),
];
