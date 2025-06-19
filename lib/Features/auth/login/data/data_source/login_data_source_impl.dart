
import 'package:dio/dio.dart';
import 'package:my_gold_dashboard/Features/auth/login/data/model/LoginResponse.dart';
import 'package:my_gold_dashboard/core/api/api_manager.dart';

import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../../../../../core/error/Failures.dart';
import '../model/login_parameters.dart';
import 'login_data_source.dart';

class LoginDataSourceImpl implements LoginDataSource{
  ApiManager apiManager;
  LoginDataSourceImpl({required this.apiManager});

  @override
  Future<ApiResult<LoginResponse>> login(LoginParameters parameters)async {
    try{
      var response = await apiManager.login(parameters);
      return response;
    }on DioException catch (e) {
      return ApiErrorResult(
          failures: NetworkFailure(e.message ?? 'An unexpected error occurred')
      );
    } catch (e) {
      return ApiErrorResult(failures: NetworkFailure('Unexpected error: ${e.toString()}'));
    }
  }
}