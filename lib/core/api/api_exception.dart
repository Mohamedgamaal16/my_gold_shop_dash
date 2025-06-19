/// الفئة الأساسية لجميع الاستثناءات
class ApiException implements Exception {
  final String message;
  final int? errorCode; // إضافة الكود الخاص بالخطأ (مثل 404، 500)
  final StackTrace? stackTrace; // إضافة معلومات الـ StackTrace

  ApiException(this.message, {this.errorCode, this.stackTrace});

  @override
  String toString() {
    return 'ApiException: $message ${errorCode != null ? "(Code: $errorCode)" : ""}';
  }

  // وظيفة لتحويل الاستثناء إلى معلومات JSON للتوثيق أو التحليل
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'errorCode': errorCode,
      'stackTrace': stackTrace?.toString(),
    };
  }
}

/// استثناء خاص بالتحقق من صحة البيانات (Validation)
class ValidationException extends ApiException {
  final List<Map<String, dynamic>> errors; // قائمة الأخطاء
  ValidationException(String message, this.errors, {int? errorCode, StackTrace? stackTrace})
      : super(message, errorCode: errorCode, stackTrace: stackTrace);

  // دالة لعرض الأخطاء بشكل منسق
  String getFormattedErrors() {
    return errors
        .map((error) => 'Field: ${error['field']}, Error: ${error['message']}')
        .join('\n');
  }

  // إعادة تعريف التوستينغ للحصول على رسائل خطأ مفصلة
  @override
  String toString() {
    return 'ValidationException: $message\nErrors:\n${getFormattedErrors()}';
  }

  // وظيفة لتحويل الاستثناء إلى JSON
  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'errors': errors,
    };
  }
}

/// استثناء خاص بالأخطاء في الشبكة (Network Error)
class NetworkException extends ApiException {
  NetworkException(String message, {int? errorCode, StackTrace? stackTrace})
      : super(message, errorCode: errorCode, stackTrace: stackTrace);
}

/// استثناء خاص بأخطاء الخوادم (Server Error)
class ServerException extends ApiException {
  ServerException(String message, {int? errorCode, StackTrace? stackTrace})
      : super(message, errorCode: errorCode, stackTrace: stackTrace);
}
