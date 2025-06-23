import '../../../../core/api/api_result.dart';
import '../../data/model/CustomerManagementResponse.dart';

abstract class CustomerManagementRepo {
  Future<ApiResult<CustomerManagementResponse>> customerManagement();

}