import 'package:my_gold_dashboard/Features/customer_management/data/data_source/customer_management_data_source.dart';
import 'package:my_gold_dashboard/Features/customer_management/data/model/CustomerManagementResponse.dart';

import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../../domain/repo/customer_management_impl.dart';

 class CustomerManagementRepoImpl implements CustomerManagementRepo{
   CustomerManagementDataSource customerManagementDataSource;
   CustomerManagementRepoImpl({required this.customerManagementDataSource});
  @override
  Future<ApiResult<CustomerManagementResponse>> customerManagement() async{
    var response = await customerManagementDataSource.customerManagement();
    return response;
  }
}