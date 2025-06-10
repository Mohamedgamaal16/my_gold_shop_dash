class OrderModel {
  final String orderId;
  final String shopName;
  final String customerName;
  final String date;
  final String amount;
  final String paymentMethod;

  OrderModel({
    required this.orderId,
    required this.shopName,
    required this.customerName,
    required this.date,
    required this.amount,
    required this.paymentMethod,
  });
}
