class Users {
  Users({
      this.id, 
      this.code, 
      this.name, 
      this.refundOrdersCount, 
      this.complaintsCount,});

  Users.fromJson(dynamic json) {
    id = json['_id'];
    code = json['code'];
    name = json['name'];
    refundOrdersCount = json['refundOrdersCount'];
    complaintsCount = json['complaintsCount'];
  }
  String? id;
  num? code;
  String? name;
  num? refundOrdersCount;
  num? complaintsCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['code'] = code;
    map['name'] = name;
    map['refundOrdersCount'] = refundOrdersCount;
    map['complaintsCount'] = complaintsCount;
    return map;
  }

}