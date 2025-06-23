import 'merchant.dart';
import 'user.dart';
import 'driver.dart';
import 'delivery.dart';
import 'items.dart';

class Orders {
  Orders({
    this.merchant,
    this.user,
    this.driver,
    this.delivery,
    this.id,
    this.orderCode,
    this.items,
    this.status,
    this.totalPrice,
    this.paymentMethod,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.logs,
  });

  Orders.fromJson(dynamic json) {
    merchant  = json['merchant'] != null ? Merchant.fromJson(json['merchant']) : null;
    user      = json['user']     != null ? User.fromJson(json['user'])         : null;
    driver    = json['driver']   != null ? Driver.fromJson(json['driver'])     : null;
    delivery  = json['delivery'] != null ? Delivery.fromJson(json['delivery']) : null;

    id        = json['_id'];
    orderCode = json['orderCode'];                       // جديد
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) => items!.add(Items.fromJson(v)));
    }
    status        = json['status'];
    totalPrice    = json['totalPrice'];
    paymentMethod = json['paymentMethod'];

    createdAt = json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null;
    updatedAt = json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null;

    v    = json['__v'];
    logs = json['logs'] != null ? List<dynamic>.from(json['logs']) : null;
  }

  Merchant?            merchant;
  User?                user;
  Driver?              driver;
  Delivery?            delivery;
  String?              id;
  int?                 orderCode;
  List<Items>?         items;
  String?              status;
  num?                 totalPrice;
  String?              paymentMethod;
  DateTime?            createdAt;
  DateTime?            updatedAt;
  num?                 v;
  List<dynamic>?       logs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (merchant != null)  map['merchant']  = merchant!.toJson();
    if (user != null)      map['user']      = user!.toJson();
    if (driver != null)    map['driver']    = driver!.toJson();
    if (delivery != null)  map['delivery']  = delivery!.toJson();

    map['_id']        = id;
    map['orderCode']  = orderCode;
    if (items != null) map['items'] = items!.map((e) => e.toJson()).toList();

    map['status']        = status;
    map['totalPrice']    = totalPrice;
    map['paymentMethod'] = paymentMethod;
    map['createdAt']     = createdAt?.toIso8601String();
    map['updatedAt']     = updatedAt?.toIso8601String();
    map['__v']           = v;
    if (logs != null)    map['logs'] = logs;

    return map;
  }
}
