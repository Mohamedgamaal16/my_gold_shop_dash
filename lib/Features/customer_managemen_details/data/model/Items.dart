class Items {
  Items({
      this.productName, 
      this.productImage,});

  Items.fromJson(dynamic json) {
    productName = json['productName'];
    productImage = json['productImage'];
  }
  String? productName;
  String? productImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productName'] = productName;
    map['productImage'] = productImage;
    return map;
  }

}