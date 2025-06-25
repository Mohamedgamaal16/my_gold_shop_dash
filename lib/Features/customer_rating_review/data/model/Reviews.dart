class Reviews {
  Reviews({
      this.orderCode, 
      this.userFirstName, 
      this.comment, 
      this.rating,});

  Reviews.fromJson(dynamic json) {
    orderCode = json['orderCode'];
    userFirstName = json['userFirstName'];
    comment = json['comment'];
    rating = json['rating'];
  }
  num? orderCode;
  String? userFirstName;
  String? comment;
  num? rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orderCode'] = orderCode;
    map['userFirstName'] = userFirstName;
    map['comment'] = comment;
    map['rating'] = rating;
    return map;
  }

}