import 'package:dio/dio.dart';
import 'package:my_gold_dashboard/Features/auth/otp/data/data_source/otp_data_source.dart';
import 'package:my_gold_dashboard/Features/auth/otp/data/model/OtpResponse.dart';
import 'package:my_gold_dashboard/Features/auth/otp/data/model/otp_parameters.dart';
import 'package:my_gold_dashboard/core/api/api_manager.dart';
import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../../../../../core/error/Failures.dart';

class OtpDataSourceImpl implements OtpDataSource{
  ApiManager apiManager;
  OtpDataSourceImpl({required this.apiManager});

  @override
  Future<ApiResult<OtpResponse>> otp(OtpParameters parameters)async {
    try{
      var response  = await apiManager.otp(parameters);
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