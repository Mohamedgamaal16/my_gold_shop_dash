import 'package:dio/dio.dart';
import 'package:my_gold_dashboard/Features/customer_managemen_details/data/model/CustomerManagementDetailsResponse.dart';
import 'package:my_gold_dashboard/core/api/api_manager.dart';

import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../../../../core/error/Failures.dart';
import 'customer_management_details_data_source.dart';

class CustomerManagementDetailsDataSourceImpl implements CustomerManagementDetailsDataSource{
  ApiManager apiManager;
  CustomerManagementDetailsDataSourceImpl({required this.apiManager});
  @override
  Future<ApiResult<CustomerManagementDetailsResponse>> customerManagementDetails(String customerId )async {
    try{
      var response =await apiManager.customerManagementDetails(customerId);
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