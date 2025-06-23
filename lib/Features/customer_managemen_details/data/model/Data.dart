import 'Orders.dart';

class Data {
  Data({
      this.userCode, 
      this.orders,});

  Data.fromJson(dynamic json) {
    userCode = json['userCode'];
    if (json['orders'] != null) {
      orders = [];
      json['orders'].forEach((v) {
        orders?.add(Orders.fromJson(v));
      });
    }
  }
  num? userCode;
  List<Orders>? orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userCode'] = userCode;
    if (orders != null) {
      map['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}