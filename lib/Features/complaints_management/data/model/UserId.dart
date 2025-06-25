class UserId {
  UserId({
      this.id, 
      this.firstName, 
      this.secondName,});

  UserId.fromJson(dynamic json) {
    id = json['_id'];
    firstName = json['firstName'];
    secondName = json['secondName'];
  }
  String? id;
  String? firstName;
  String? secondName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['firstName'] = firstName;
    map['secondName'] = secondName;
    return map;
  }

}