import 'package:my_gold_dashboard/Features/customer_managemen_details/data/data_source/customer_management_details_data_source.dart';
import 'package:my_gold_dashboard/Features/customer_managemen_details/data/model/CustomerManagementDetailsResponse.dart';

import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../../domain/repo/customer_management_details_repo.dart';

class CustomerManagementDetailsRepoImpl implements CustomerManagementDetailsRepo{
  CustomerManagementDetailsDataSource customerManagementDetailsDataSource;
  CustomerManagementDetailsRepoImpl({required this.customerManagementDetailsDataSource});
  @override
  Future<ApiResult<CustomerManagementDetailsResponse>> customerManagementDetails(String customerId) async{
    var response  = await customerManagementDetailsDataSource.customerManagementDetails(customerId);
    return response;
    }

}