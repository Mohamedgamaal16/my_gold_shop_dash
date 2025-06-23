import 'package:my_gold_dashboard/Features/returns_managment/data/data_source/return_management_data_source.dart';
import 'package:my_gold_dashboard/Features/returns_managment/data/model/ReturnManagementResponse.dart';

import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../../domain/repo/return_management_repo.dart';

class ReturnManagementRepoImpl implements ReturnManagementRepo{
  ReturnManagementDataSource returnManagementDataSource;
  ReturnManagementRepoImpl({required this.returnManagementDataSource});
  @override
  Future<ApiResult<ReturnManagementResponse>> returnManagement() async{
    var response  =await  returnManagementDataSource.returnManagement();
    return response;
  }
}