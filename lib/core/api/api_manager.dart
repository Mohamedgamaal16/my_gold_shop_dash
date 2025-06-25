import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_gold_dashboard/Features/auth/login/data/model/login_parameters.dart';
import 'package:my_gold_dashboard/Features/auth/login/data/model/LoginResponse.dart';
import 'package:my_gold_dashboard/Features/auth/otp/data/model/OtpResponse.dart';
import 'package:my_gold_dashboard/Features/auth/otp/data/model/otp_parameters.dart';
import '../../Features/complaints_management/data/model/ComplaintsManagementResponse.dart';
import '../../Features/customer_managemen_details/data/model/CustomerManagementDetailsResponse.dart';
import '../../Features/customer_management/data/model/CustomerManagementResponse.dart';
import '../../Features/customer_rating_review/data/model/CustomerRatingReviewRespone.dart';
import '../../Features/returns_managment/data/model/ReturnManagementResponse.dart';
import '../error/Failures.dart';
import '../resources/constants_manager.dart';
import 'api_result.dart';

class ApiManager {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      responseType: ResponseType.json,
    ),
  );

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  ApiManager() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _storage.read(key: 'access_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (e, handler) async {
          if (e.response?.statusCode == 401) {
            await _storage.delete(key: 'access_token');
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<bool> _isConnected() async {
    final List<ConnectivityResult> result =
    await Connectivity().checkConnectivity();
    return result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi);
  }

  Future<Response?> getRequest(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(endpoint, queryParameters: queryParameters);
      return response;
    } on DioException catch (error) {
      print("Get Error: ${error.message}");
      return null;
    }
  }

  Future<Response?> postRequest(String endpoint, dynamic data,
      {Map<String, String>? headers}) async {
    try {
      final response = await dio.post(
        endpoint,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (error) {
      print("Post Error: ${error.message}");
      return null;
    }
  }

  Future<Response?> putRequest(String endpoint, dynamic data,
      {Map<String, String>? headers}) async {
    try {
      final response = await dio.put(
        endpoint,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (error) {
      print("Put Error: ${error.message}");
      return null;
    }
  }

  Future<Response?> patchRequest(String endpoint, dynamic data,
      {Map<String, String>? headers}) async {
    try {
      final response = await dio.patch(
        endpoint,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (error) {
      print("Patch Error: ${error.message}");
      return null;
    }
  }

  Future<Response?> deleteRequest(String endpoint,
      {Map<String, String>? headers}) async {
    try {
      final response = await dio.delete(
        endpoint,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (error) {
      print("Delete Error: ${error.message}");
      return null;
    }
  }

  Future<ApiResult<LoginResponse>> login(LoginParameters parameters) async {
    if (!await _isConnected()) {
      return ApiErrorResult(
        failures: NetworkFailure('تحقق من اتصالك بالإنترنت'),
      );
    }

    try {
      final response = await postRequest(
        AppConstants.loginEndPoint,
        parameters.toJson(),
        headers: {'Content-Type': 'application/json'},
      );

      if (response != null && response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return ApiSuccessResult(
            data: LoginResponse.fromJson(response.data),
          );
        } else {
          return ApiErrorResult(
            failures: ServerFailure('Error: ${response.statusCode}'),
          );
        }
      } else {
        return ApiErrorResult(
          failures: ServerFailure('No response from server'),
        );
      }
    } on DioException catch (e) {
      return ApiErrorResult(
        failures: NetworkFailure(e.message ?? 'Network error occurred'),
      );
    }
  }

  Future<ApiResult<OtpResponse>> otp(OtpParameters parameters) async {
    if (!await _isConnected()) {
      return ApiErrorResult(
        failures: NetworkFailure('تحقق من اتصالك بالإنترنت'),
      );
    }

    try {
      final response = await postRequest(
        AppConstants.otpEndPoint,
        parameters.toJson(),
        headers: {'Content-Type': 'application/json'},
      );

      if (response != null && response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return ApiSuccessResult(
            data: OtpResponse.fromJson(response.data),
          );
        } else {
          return ApiErrorResult(
            failures: ServerFailure('Error: ${response.statusCode}'),
          );
        }
      } else {
        return ApiErrorResult(
          failures: ServerFailure('No response from server'),
        );
      }
    } on DioException catch (e) {
      return ApiErrorResult(
        failures: NetworkFailure(e.message ?? 'Network error occurred'),
      );
    }
  }


  Future<ApiResult<CustomerManagementResponse>> customerManagement() async {
    if (!await _isConnected()) {
      return ApiErrorResult(
        failures: NetworkFailure('تحقق من اتصالك بالإنترنت'),
      );
    }

    try {
      final response = await getRequest(
        AppConstants.customerManagementEndPoint,

      );

      if (response != null && response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return ApiSuccessResult(
            data: CustomerManagementResponse.fromJson(response.data),
          );
        } else {
          return ApiErrorResult(
            failures: ServerFailure('Error: ${response.statusCode}'),
          );
        }
      } else {
        return ApiErrorResult(
          failures: ServerFailure('No response from server'),
        );
      }
    } on DioException catch (e) {
      return ApiErrorResult(
        failures: NetworkFailure(e.message ?? 'Network error occurred'),
      );
    }
  }





  Future<ApiResult<CustomerManagementDetailsResponse>> customerManagementDetails(String customerId ) async {
    if (!await _isConnected()) {
      return ApiErrorResult(
        failures: NetworkFailure('تحقق من اتصالك بالإنترنت'),
      );
    }

    try {
      final response = await getRequest(
        "${AppConstants.customerManagementDetEndPoint+customerId}",

      );

      if (response != null && response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return ApiSuccessResult(
            data: CustomerManagementDetailsResponse.fromJson(response.data),
          );
        } else {
          return ApiErrorResult(
            failures: ServerFailure('Error: ${response.statusCode}'),
          );
        }
      } else {
        return ApiErrorResult(
          failures: ServerFailure('No response from server'),
        );
      }
    } on DioException catch (e) {
      return ApiErrorResult(
        failures: NetworkFailure(e.message ?? 'Network error occurred'),
      );
    }
  }


  Future<ApiResult<ReturnManagementResponse>> returnManagement() async {
    if (!await _isConnected()) {
      return ApiErrorResult(
        failures: NetworkFailure('تحقق من اتصالك بالإنترنت'),
      );
    }

    try {
      final response = await getRequest(
        AppConstants.returnManagementEndPoint,

      );

      if (response != null && response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return ApiSuccessResult(
            data: ReturnManagementResponse.fromJson(response.data),
          );
        } else {
          return ApiErrorResult(
            failures: ServerFailure('Error: ${response.statusCode}'),
          );
        }
      } else {
        return ApiErrorResult(
          failures: ServerFailure('No response from server'),
        );
      }
    } on DioException catch (e) {
      return ApiErrorResult(
        failures: NetworkFailure(e.message ?? 'Network error occurred'),
      );
    }
  }



  Future<ApiResult<ComplaintsManagementResponse>> complaintsManagement() async {
    if (!await _isConnected()) {
      return ApiErrorResult(
        failures: NetworkFailure('تحقق من اتصالك بالإنترنت'),
      );
    }

    try {
      final response = await getRequest(
        AppConstants.complaintsManagementEndPoint,

      );

      if (response != null && response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return ApiSuccessResult(
            data: ComplaintsManagementResponse.fromJson(response.data),
          );
        } else {
          return ApiErrorResult(
            failures: ServerFailure('Error: ${response.statusCode}'),
          );
        }
      } else {
        return ApiErrorResult(
          failures: ServerFailure('No response from server'),
        );
      }
    } on DioException catch (e) {
      return ApiErrorResult(
        failures: NetworkFailure(e.message ?? 'Network error occurred'),
      );
    }
  }




  Future<ApiResult<CustomerRatingReviewRespone>> customerRatingReview() async {
    if (!await _isConnected()) {
      return ApiErrorResult(
        failures: NetworkFailure('تحقق من اتصالك بالإنترنت'),
      );
    }

    try {
      final response = await getRequest(
        AppConstants.customerRatingReviewEndPoint,

      );

      if (response != null && response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return ApiSuccessResult(
            data: CustomerRatingReviewRespone.fromJson(response.data),
          );
        } else {
          return ApiErrorResult(
            failures: ServerFailure('Error: ${response.statusCode}'),
          );
        }
      } else {
        return ApiErrorResult(
          failures: ServerFailure('No response from server'),
        );
      }
    } on DioException catch (e) {
      return ApiErrorResult(
        failures: NetworkFailure(e.message ?? 'Network error occurred'),
      );
    }
  }



}
