
class OtpParameters {
  final String phone;
  final String otp;

  OtpParameters({required this.phone, required this.otp});

  Map<String, dynamic> toJson() {
    return {
      "phone": phone,
      "otp": otp,
    };
  }
}






//
// class login_request_body {
//   String? userName;
//   String? pwd;
//
//   login_request_body({this.userName, this.pwd});
//
//   login_request_body.fromJson(Map<String, dynamic> json) {
//     userName = json['userName'];
//     pwd = json['pwd'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['userName'] = this.userName;
//     data['pwd'] = this.pwd;
//     return data;
//   }
// }
