class Delivery {
  Delivery({
      this.type,});

  Delivery.fromJson(dynamic json) {
    type = json['type'];
  }
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    return map;
  }

}