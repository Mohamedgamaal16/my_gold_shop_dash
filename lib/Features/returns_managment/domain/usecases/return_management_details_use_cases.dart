
import 'package:my_gold_dashboard/Features/returns_managment/data/model/ReturnManagementResponse.dart';
import 'package:my_gold_dashboard/Features/returns_managment/domain/repo/return_management_repo.dart';

import '../../../../core/api/api_result.dart';

class ReturnManagementDetailsUseCases{
ReturnManagementRepo returnManagementRepo;

  ReturnManagementDetailsUseCases({required this.returnManagementRepo});
  Future<ApiResult<ReturnManagementResponse>> call() => returnManagementRepo.returnManagement();
}