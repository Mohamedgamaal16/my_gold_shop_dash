import 'Users.dart';

class CustomerManagementResponse {
  CustomerManagementResponse({
      this.message, 
      this.users,});

  CustomerManagementResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((v) {
        users?.add(Users.fromJson(v));
      });
    }
  }
  String? message;
  List<Users>? users;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (users != null) {
      map['users'] = users?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}