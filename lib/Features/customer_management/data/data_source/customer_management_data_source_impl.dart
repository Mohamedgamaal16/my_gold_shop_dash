import 'package:dio/dio.dart';
import 'package:my_gold_dashboard/Features/customer_management/data/model/CustomerManagementResponse.dart';
import 'package:my_gold_dashboard/core/api/api_manager.dart';

import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../../../../core/error/Failures.dart';
import 'customer_management_data_source.dart';

class CustomerManagementDataSourceImpl implements CustomerManagementDataSource{
  ApiManager apiManager;
  CustomerManagementDataSourceImpl({required this.apiManager});
  @override
  Future<ApiResult<CustomerManagementResponse>> customerManagement()async {
    try{
      var response = await apiManager.customerManagement();
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