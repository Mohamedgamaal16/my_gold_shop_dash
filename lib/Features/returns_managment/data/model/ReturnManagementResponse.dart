import 'ReturnData.dart';

class ReturnManagementResponse {
  ReturnManagementResponse({
      this.message, 
      this.returnData,});

  ReturnManagementResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['returnData'] != null) {
      returnData = [];
      json['returnData'].forEach((v) {
        returnData?.add(ReturnData.fromJson(v));
      });
    }
  }
  String? message;
  List<ReturnData>? returnData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (returnData != null) {
      map['returnData'] = returnData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}