import 'dart:ui';

class SalesData {
  final String day;
  final int amount;
  SalesData(this.day, this.amount);
}

class PaymentType {
  final String type;
  final int percent;
  final Color color;
  PaymentType(this.type, this.percent, this.color);
}
