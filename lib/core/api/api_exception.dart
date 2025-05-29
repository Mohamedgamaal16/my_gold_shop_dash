class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
}

class ValidationException extends ApiException {
  final List<Map<String, dynamic>> errors;
  ValidationException(String message, this.errors) : super(message);
}
