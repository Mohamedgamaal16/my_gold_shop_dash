class OtpResponse {
  OtpResponse({
      this.message, 
      this.accessToken,});

  OtpResponse.fromJson(dynamic json) {
    message = json['message'];
    accessToken = json['accessToken'];
  }
  String? message;
  String? accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['accessToken'] = accessToken;
    return map;
  }

}