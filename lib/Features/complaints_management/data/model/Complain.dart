import 'UserId.dart';

class Complain {
  Complain({
      this.id, 
      this.complainCode, 
      this.userId, 
      this.issue, 
      this.description,});

  Complain.fromJson(dynamic json) {
    id = json['_id'];
    complainCode = json['complainCode'];
    userId = json['userId'] != null ? UserId.fromJson(json['userId']) : null;
    issue = json['issue'];
    description = json['description'];
  }
  String? id;
  num? complainCode;
  UserId? userId;
  String? issue;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['complainCode'] = complainCode;
    if (userId != null) {
      map['userId'] = userId?.toJson();
    }
    map['issue'] = issue;
    map['description'] = description;
    return map;
  }

}