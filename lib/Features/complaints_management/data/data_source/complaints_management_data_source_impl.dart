import 'package:dio/dio.dart';
import 'package:my_gold_dashboard/Features/complaints_management/data/model/ComplaintsManagementResponse.dart';
import 'package:my_gold_dashboard/core/api/api_manager.dart';

import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../../../../core/error/Failures.dart';
import 'complaints_management_data_source.dart';

class ComplaintsManagementDataSourceImpl implements ComplaintsManagementDataSource{
  ApiManager apiManager;
  ComplaintsManagementDataSourceImpl({required this.apiManager});

  @override
  Future<ApiResult<ComplaintsManagementResponse>> complaintsManagement() async{
    try{
      var response  = await apiManager.complaintsManagement();
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