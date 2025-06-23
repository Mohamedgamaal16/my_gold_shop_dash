class ReturnData {
  ReturnData({
      this.id, 
      this.returnCode, 
      this.orderCode, 
      this.name, 
      this.reason, 
      this.merchantName, 
      this.orderPic, 
      this.status, 
      this.createdAt,});

  ReturnData.fromJson(dynamic json) {
    id = json['_id'];
    returnCode = json['returnCode'];
    orderCode = json['orderCode'];
    name = json['name'];
    reason = json['reason'];
    merchantName = json['merchantName'];
    orderPic = json['orderPic'];
    status = json['status'];
    createdAt = json['createdAt'];
  }
  String? id;
  num? returnCode;
  num? orderCode;
  String? name;
  String? reason;
  String? merchantName;
  String? orderPic;
  String? status;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['returnCode'] = returnCode;
    map['orderCode'] = orderCode;
    map['name'] = name;
    map['reason'] = reason;
    map['merchantName'] = merchantName;
    map['orderPic'] = orderPic;
    map['status'] = status;
    map['createdAt'] = createdAt;
    return map;
  }

}