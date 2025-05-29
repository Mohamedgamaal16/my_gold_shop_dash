import 'package:dio/dio.dart';

class DioClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://fasla.vercel.app/api/v1/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  final String books = 'book/books';
  final String sections = 'book/sections';
  final String banner = 'book/get-banner';
 final  String register = "/auth/register";
  final  String login = "/auth/login";
  final  String verify = "/auth/verify";
  final  String refresh = "/auth/refresh";
  final  String library = "/user/library";
  static Dio get instance => _dio;
}
