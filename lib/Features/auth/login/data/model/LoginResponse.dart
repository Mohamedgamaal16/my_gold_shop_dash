class LoginResponse {
  LoginResponse({
      this.message, 
      this.otp,});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    otp = json['otp'];
  }
  String? message;
  String? otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['otp'] = otp;
    return map;
  }

}