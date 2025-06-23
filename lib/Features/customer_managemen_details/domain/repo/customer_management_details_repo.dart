
import '../../../../core/api/api_result.dart';
import '../../data/model/CustomerManagementDetailsResponse.dart';

abstract class CustomerManagementDetailsRepo{
  Future<ApiResult<CustomerManagementDetailsResponse>> customerManagementDetails(String customerId);
}