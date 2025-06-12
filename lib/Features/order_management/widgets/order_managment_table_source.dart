

import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/order_management/order/order_model.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';

class OrdersDataSource extends DataTableSource {
  OrdersDataSource(
    this.context, 
    this.orders, {
    this.onAccept,
    this.onRefuse,
  });

  final BuildContext context;
  final List<OrderModel> orders;
  final void Function()? onAccept;
  final void Function()? onRefuse;

  @override
  DataRow? getRow(int index) {
    final order = orders[index];
    
    return DataRow(
      cells: [
        // Order ID
        DataCell(
          Center(
            child: Text(
              order.orderId,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ),
        
        // Customer Name
        DataCell(
          Center(
            child: Text(order.customerName),
          ),
        ),
        
        // Payment Method
        DataCell(
          Center(
            child: Text(order.paymentMethod),
          ),
        ),
        
        // Merchant
        DataCell(
          Center(
            child: Text(order.merchant),
          ),
        ),
        
        // Product
        DataCell(
          Center(
            child: Text(order.product),
          ),
        ),
        
        // Order Date
        DataCell(
          Center(
            child: Text(order.orderDate),
          ),
        ),
        
        // Order State
        DataCell(
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: _getStateColor(order.orderState),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                order.orderState,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        
        // Actions
        DataCell(
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Accept Button
                ElevatedButton(
                  onPressed: () => onAccept,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.trafficLightColorsSuccess,
                    foregroundColor: AppColors.colorsSurface,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    minimumSize: const Size(80, 32),
                  ),
                  child: const Text(
                    'Accept',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                
                const SizedBox(width: 8),
                
                // Refuse Button
                ElevatedButton(
                  onPressed: onRefuse,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.trafficLightColorsError,
                    foregroundColor: AppColors.colorsSurface,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    minimumSize: const Size(80, 32),
                  ),
                  child: const Text(
                    'Refuse',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Color _getStateColor(String state) {
    switch (state.toLowerCase()) {
      case 'emergency':
        return AppColors.trafficLightColorsError;
      case 'schedule':
        return AppColors.trafficLightColorsSuccess;
      case 'regular':
        return AppColors.greyScaleNearWhite;
      default:
        return AppColors.lightGreenColor;
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => orders.length;

  @override
  int get selectedRowCount => 0;
}
