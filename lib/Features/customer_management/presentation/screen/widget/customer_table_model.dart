
class CustomerTableModel {
  final String customerId;
  final String customerName;
  final int complaints;
  final int refunds;
  final void Function()? onViewHistory;

  CustomerTableModel({
    required this.customerId,
    required this.customerName,
    required this.complaints,
    required this.refunds,
    this.onViewHistory,
  });
}
