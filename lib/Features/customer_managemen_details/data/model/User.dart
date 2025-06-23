import 'Location.dart';

class User {
  User({
      this.location, 
      this.id, 
      this.name, 
      this.phone, 
      this.address,});

  User.fromJson(dynamic json) {
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
  }
  Location? location;
  String? id;
  String? name;
  String? phone;
  String? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['address'] = address;
    return map;
  }

}