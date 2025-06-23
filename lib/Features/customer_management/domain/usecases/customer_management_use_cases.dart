
import 'package:my_gold_dashboard/Features/customer_management/data/model/CustomerManagementResponse.dart';
import 'package:my_gold_dashboard/Features/customer_management/domain/repo/customer_management_impl.dart';

import '../../../../core/api/api_result.dart';

class CustomerManagementUseCases{
  CustomerManagementRepo customerManagementRepo;
  CustomerManagementUseCases({required this.customerManagementRepo});
  Future<ApiResult<CustomerManagementResponse>> call() => customerManagementRepo.customerManagement();
}