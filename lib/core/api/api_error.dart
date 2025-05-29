import 'package:dio/dio.dart';
import 'package:my_gold_dashboard/core/api/api_exception.dart';

void handleDioError(DioException e) {
  try {
    if (e.response != null) {
      if (e.response?.data != null) {
        // Handle case where response data is available
        final data = e.response?.data;
        if (data is Map<String, dynamic>) {
          // Handle structured JSON error response
          throw ApiException(data['message'] ?? data['error'] ?? 'Server error');
        } else if (data is String) {
          // Handle string error response
          throw ApiException(data.isNotEmpty ? data : 'Server error');
        } else {
          // Handle other data types
          throw ApiException('Server error with status code: ${e.response?.statusCode}');
        }
      } else {
        // Handle case with response but no data
        throw ApiException('Server error with status code: ${e.response?.statusCode}');
      }
    } else if (e.type == DioExceptionType.connectionTimeout) {
      throw ApiException('Connection timeout');
    } else if (e.type == DioExceptionType.sendTimeout) {
      throw ApiException('Send timeout');
    } else if (e.type == DioExceptionType.receiveTimeout) {
      throw ApiException('Receive timeout');
    } else if (e.type == DioExceptionType.cancel) {
      throw ApiException('Request cancelled');
    } else {
      // Handle other DioException types
      throw ApiException(e.message ?? 'Network error');
    }
  } catch (error) {
    // Catch any other exceptions that might occur while handling the DioException
    if (error is ApiException) {
      // Rethrow ApiException
      rethrow;
    } else {
      // Wrap unexpected errors
      throw ApiException('Unexpected error: ${error.toString()}');
    }
  }
}