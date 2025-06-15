// Updated ReturnModel with all required fields
class ReturnModel {
  final String returnId;
  final String orderId;
  final String customerName;
  final String reason;
  final String merchant;
  final String date;
  final String orderPic;
  final String status;
  final bool isSelected;
    final String customerId;
  final String receivedDate;
  final String product;
  final String refundDate;
  final String deliveryName;
  final String paymentMethod;
  final String refundStatus;

  ReturnModel({
    required this.returnId,
    required this.orderId,
    required this.customerName,
    required this.reason,
    required this.merchant,
    required this.date,
    required this.orderPic,
    required this.status,
    this.isSelected = false,
    required this.customerId,
    required this.receivedDate,
    required this.product,
    required this.refundDate,
    required this.deliveryName,
    required this.paymentMethod,
    required this.refundStatus,
  });

  ReturnModel copyWith({
    String? returnId,
    String? orderId,
    String? customerName,
    String? reason,
    String? merchant,
    String? date,
    String? orderPic,
    String? status,
    bool? isSelected,
    String? customerId,
    String? receivedDate,
    String? product,
    String? refundDate,
    String? deliveryName,
    String? paymentMethod,
    String? refundStatus,
  }) {
    return ReturnModel(
      returnId: returnId ?? this.returnId,
      orderId: orderId ?? this.orderId,
      customerName: customerName ?? this.customerName,
      reason: reason ?? this.reason,
      merchant: merchant ?? this.merchant,
      date: date ?? this.date,
      orderPic: orderPic ?? this.orderPic,
      status: status ?? this.status,
      isSelected: isSelected ?? this.isSelected,
      customerId: customerId ?? this.customerId,
      receivedDate: receivedDate ?? this.receivedDate,
      product: product ?? this.product,
      refundDate: refundDate ?? this.refundDate,
      deliveryName: deliveryName ?? this.deliveryName,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      refundStatus: refundStatus ?? this.refundStatus,
    );
  }
}