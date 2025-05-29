class ApiResponse {
  final String? message;
  final String? otp;
  final List<dynamic>? errors;

  ApiResponse({this.message, this.otp, this.errors});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      message: json['message'],
      otp: json['otp'],
      errors: json['errors'],
    );
  }
}
