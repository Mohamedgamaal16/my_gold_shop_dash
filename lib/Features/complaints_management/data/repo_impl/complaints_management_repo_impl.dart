import 'package:my_gold_dashboard/Features/complaints_management/data/data_source/complaints_management_data_source.dart';
import 'package:my_gold_dashboard/Features/complaints_management/data/model/ComplaintsManagementResponse.dart';

import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../../domain/repo/complaints_management_repo.dart';

class ComplaintsManagementRepoImpl implements ComplaintsManagementRepo{
  ComplaintsManagementDataSource complaintsManagementDataSource;
  ComplaintsManagementRepoImpl({required this.complaintsManagementDataSource});
  @override
  Future<ApiResult<ComplaintsManagementResponse>> complaintsManagement()async {
    var response = await complaintsManagementDataSource.complaintsManagement();
    return response;
  }
}