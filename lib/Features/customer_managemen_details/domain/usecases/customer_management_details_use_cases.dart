
import '../../../../core/api/api_result.dart';
import '../../data/model/CustomerManagementDetailsResponse.dart';
import '../repo/customer_management_details_repo.dart';

class CustomerManagementDetailsUseCases{
  CustomerManagementDetailsRepo customerManagementDetailsRepo;
  CustomerManagementDetailsUseCases({required this.customerManagementDetailsRepo});
  Future<ApiResult<CustomerManagementDetailsResponse>> call(String customerId) => customerManagementDetailsRepo.customerManagementDetails(customerId);
}