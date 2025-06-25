import 'Complain.dart';

class ComplaintsManagementResponse {
  ComplaintsManagementResponse({
      this.message, 
      this.complain,});

  ComplaintsManagementResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['complain'] != null) {
      complain = [];
      json['complain'].forEach((v) {
        complain?.add(Complain.fromJson(v));
      });
    }
  }
  String? message;
  List<Complain>? complain;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (complain != null) {
      map['complain'] = complain?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}