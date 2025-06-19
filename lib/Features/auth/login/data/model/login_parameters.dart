
class LoginParameters {
  final String phone;

  LoginParameters({required this.phone});

  Map<String, dynamic> toJson() {
    return {
      "phone": phone,
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
