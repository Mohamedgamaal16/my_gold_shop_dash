import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../model/CustomerManagementDetailsResponse.dart';

abstract class CustomerManagementDetailsDataSource{
  Future<ApiResult<CustomerManagementDetailsResponse>> customerManagementDetails(String customerId);
}