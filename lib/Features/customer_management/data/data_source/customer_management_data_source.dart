import 'package:my_gold_dashboard/Features/customer_management/data/model/CustomerManagementResponse.dart';
import 'package:my_gold_dashboard/core/api/api_result.dart';

abstract class CustomerManagementDataSource {
  Future<ApiResult<CustomerManagementResponse>> customerManagement();
}