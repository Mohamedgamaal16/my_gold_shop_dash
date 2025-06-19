import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/auth/login/data/model/login_parameters.dart';
import '../../Features/auth/login/data/model/LoginResponse.dart';
import '../error/Failures.dart';
import '../model/user_model.dart';
import '../resources/constants_manager.dart';
import 'api_exception.dart';
import 'api_result.dart';

// class ApiManager {
//   static final Dio _dio = Dio(
//     BaseOptions(
//       baseUrl: 'https://mygold.uber.space/dashboard/',
//       connectTimeout: const Duration(seconds: 10),
//       receiveTimeout: const Duration(seconds: 10),
//     ),
//   );
//
//   static void _addInterceptors() {
//     _dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler) {
//         options.headers['Authorization'] = 'Bearer ${UserModel.instance.token}';
//         return handler.next(options);
//       },
//       onResponse: (response, handler) {
//         return handler.next(response);
//       },
//       onError: (DioException e, handler) {
//         if (e.response != null) {
//           final errorMessage = e.response?.data ?? e.message;
//           handler.reject(DioException(
//             requestOptions: e.requestOptions,
//             type: DioExceptionType.badResponse,
//             error: ApiException(errorMessage),
//           ));
//         } else {
//           handler.reject(DioException(
//             requestOptions: e.requestOptions,
//             type: DioExceptionType.connectionError,
//             error: ApiException('Network Error: ${e.message}'),
//           ));
//         }
//         return handler.next(e);
//       },
//     ));
//   }
//
//
//
//   static Dio get instance {
//     _addInterceptors();
//     return _dio;
//   }
//
//
//   /// ===================== Endpoints ====================
//   final String books = 'book/books';
//   final String sections = 'book/sections';
//   final String banner = 'book/get-banner';
//   final String register = "/auth/register";
//   final String loginEndPoint = "login";
//   final String verify = "/auth/verify";
//   final String refresh = "/auth/refresh";
//   final String library = "/user/library";
//
//   /// ===================== Request Methods ====================
//
//   //TODO:====================== Function IS Connected =======
//   Future<bool> _isConnected() async {
//     final List<ConnectivityResult> connectivityResult =
//     await Connectivity().checkConnectivity();
//     return connectivityResult.contains(ConnectivityResult.mobile) ||
//         connectivityResult.contains(ConnectivityResult.wifi) ||
//         connectivityResult.contains(ConnectivityResult.vpn);
//   }
//
//   /// Get Request
//   Future<Response?> getRequest(
//       String endpoint, {
//         Map<String, dynamic>? queryParameters,
//         Options? options,
//       }) async {
//     if (!await _isConnected()) {
//       throw ApiException('No internet connection');
//     }
//
//     try {
//       final response = await _dio.get(
//         endpoint,
//         queryParameters: queryParameters,
//         options: options,
//       );
//       return response;
//     } on DioException catch (error) {
//       throw ApiException('Get request failed: ${error.message}');
//     }
//   }
//
//   /// Post Request
//   Future<Response?> postRequest(
//       String endpoint,
//       dynamic data, {
//         Map<String, String>? headers,
//       }) async {
//     if (!await _isConnected()) {
//       throw ApiException('No internet connection');
//     }
//
//     try {
//       final response = await _dio.post(
//         endpoint,
//         data: data,
//         options: Options(headers: headers),
//       );
//       return response;
//     } on DioException catch (error) {
//       throw ApiException('Post request failed: ${error.message}');
//     }
//   }
//
//   /// Put Request
//   Future<Response?> putRequest(
//       String endpoint,
//       dynamic data, {
//         Map<String, String>? headers,
//       }) async {
//     if (!await _isConnected()) {
//       throw ApiException('No internet connection');
//     }
//
//     try {
//       final response = await _dio.put(
//         endpoint,
//         data: data,
//         options: Options(headers: headers),
//       );
//       return response;
//     } on DioException catch (error) {
//       throw ApiException('Put request failed: ${error.message}');
//     }
//   }
//
//   /// Patch Request
//   Future<Response?> patchRequest(
//       String endpoint,
//       dynamic data, {
//         Map<String, String>? headers,
//       }) async {
//     if (!await _isConnected()) {
//       throw ApiException('No internet connection');
//     }
//
//     try {
//       final response = await _dio.patch(
//         endpoint,
//         data: data,
//         options: Options(headers: headers),
//       );
//       return response;
//     } on DioException catch (error) {
//       throw ApiException('Patch request failed: ${error.message}');
//     }
//   }
//
//   /// Delete Request
//   Future<Response?> deleteRequest(
//       String endpoint, {
//         Map<String, String>? headers,
//       }) async {
//     if (!await _isConnected()) {
//       throw ApiException('No internet connection');
//     }
//
//     try {
//       final response = await _dio.delete(
//         endpoint,
//         options: Options(headers: headers),
//       );
//       return response;
//     } on DioException catch (error) {
//       throw ApiException('Delete request failed: ${error.message}');
//     }
//   }
//
//   /// ===================== Login  Methods ====================
//   Future<ApiResult<LoginResponse>> login(String phoneNumber) async {
//     try {
//       final response = await _dio.post(
//         "login",
//         data: {'phone': phoneNumber},
//       );
//
//       if (response.statusCode == 200) {
//         LoginResponse loginResponse = LoginResponse.fromJson(response.data);
//         return ApiSuccessResult(data: loginResponse);
//       } else {
//         return ApiErrorResult(
//             failures: ServerFailure('Error: ${response.statusCode}'));
//       }
//     } on DioException catch (e) {
//       print("DioException error: ${e.message}");
//       print("DioException details: ${e.response}");
//       return ApiErrorResult(failures: NetworkFailure('Network error: ${e.message}'));
//     }
//   }}


class ApiManager {

  final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
      )
  );

  // TODO : =================== GetRequest ==============
  Future<Response?> getRequest(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await dio.get(
          endpoint, queryParameters: queryParameters);
      return response;
    } on DioException catch (error) {
      print("Get Error: " '${error.message}');
      return null;
    }
  }

  // TODO : =================== PostRequest ==============

  Future<Response?> postRequest(String endpoint, dynamic data,
      {Map<String, String>? headers}) async {
    try {
      Response response = await dio.post(
          endpoint, data: data, options: Options(headers: headers));
      return response;
    } on DioException catch (error) {
      print("Post Error: " '${error.message}');
      return null;
    }
  }

  // TODO : =================== PutRequest ==============
  Future<Response?> putRequest(String endpoint, dynamic data,
      {Map<String, String>? headers}) async {
    try {
      Response response = await dio.put(
          endpoint, data: data, options: Options(headers: headers));
      return response;
    } on DioException catch (error) {
      print("Put Error: " '${error.message}');
      return null;
    }
  }

// TODO : =================== PatchRequest ==============
  Future<Response?> patchRequest(String endpoint, dynamic data,
      {Map<String, String>? headers}) async {
    try {
      Response response = await dio.patch(
          endpoint, data: data, options: Options(headers: headers));
      return response;
    } on DioException catch (error) {
      print("Patch Error: " '${error.message}');
      return null;
    }
  }

  // TODO : =================== DeleteRequest ==============
  Future<Response?> deleteRequest(String endpoint,
      {Map<String, String>? headers}) async {
    try {
      Response response = await dio.delete(
          endpoint, options: Options(headers: headers));
      return response;
    } on DioException catch (error) {
      print("Delete Error: " '${error.message}');
      return null;
    }
  }

//TODO:====================== Function IS Connected =======
  Future<bool> _isConnected() async {
    final List<ConnectivityResult> connectivityResult =
    await Connectivity().checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi);
  }


  // /// ===================== Login  Methods ====================
  // Future<ApiResult<LoginResponse>> login(String phoneNumber) async {
  //   try {
  //     final response = await _dio.post(
  //       "login",
  //       data: {'phone': phoneNumber},
  //     );
  //
  //
  //     if (response.statusCode == 200) {
  //       LoginResponse loginResponse = LoginResponse.fromJson(response.data);
  //       return ApiSuccessResult(data: loginResponse);
  //     } else {
  //       return ApiErrorResult(
  //           failures: ServerFailure('Error: ${response.statusCode}'));
  //     }
  //   } on DioException catch (e) {
  //     print("DioException error: ${e.message}");
  //     print("DioException details: ${e.response}");
  //     return ApiErrorResult(failures: NetworkFailure('Network error: ${e.message}'));
  //   }
  // }
  ///TODO:====================== Function IS home tab =======
  Future<ApiResult<LoginResponse>>login(LoginParameters parameters) async {
    if (!await _isConnected()) {
      return ApiErrorResult(
          failures: NetworkFailure('تحقق من اتصالك بالإنترنت'));
    }
    try {
      final response = await postRequest(
        AppConstants.baseUrl + AppConstants.loginEndPoint,
        LoginParameters(phone: parameters.phone),
        headers: {'Content-Type': 'application/json'},
      );

      if (response != null && response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return ApiSuccessResult(data: LoginResponse.fromJson(response.data));
        } else {
          print("Error response: ${response.data}");
          return ApiErrorResult(failures: ServerFailure('Error: ${response.statusCode}'));
        }
      } else {
        print("No response from server");
        return ApiErrorResult(failures: ServerFailure('No response from server'));
      }
    } on DioException catch (e) {
      print("DioException details: ${e.message}");
      return ApiErrorResult(failures: NetworkFailure(e.message ?? 'Network error occurred'));
    }
  }

}