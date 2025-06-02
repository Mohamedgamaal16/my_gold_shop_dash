class OrderModel {
  final String orderId;
  final String customerName;
  final String paymentMethod;
  final String merchant;
  final String product;
  final String orderDate;
  final String orderState;
  
  OrderModel({
    required this.orderId,
    required this.customerName,
    required this.paymentMethod,
    required this.merchant,
    required this.product,
    required this.orderDate,
    required this.orderState,
  });
}