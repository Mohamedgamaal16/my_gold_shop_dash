import 'package:dio/dio.dart';
import 'package:my_gold_dashboard/Features/returns_managment/data/data_source/return_management_data_source.dart';
import 'package:my_gold_dashboard/Features/returns_managment/data/model/ReturnManagementResponse.dart';
import 'package:my_gold_dashboard/core/api/api_manager.dart';
import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../../../../core/error/Failures.dart';

class ReturnManagementDataSourceImpl implements ReturnManagementDataSource{
  ApiManager apiManager;
  ReturnManagementDataSourceImpl({required this.apiManager});
  @override
  Future<ApiResult<ReturnManagementResponse>> returnManagement()async {
    try{
      var response  = await apiManager.returnManagement();
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