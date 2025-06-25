
import 'package:my_gold_dashboard/Features/complaints_management/data/model/ComplaintsManagementResponse.dart';
import 'package:my_gold_dashboard/Features/complaints_management/domain/repo/complaints_management_repo.dart';

import '../../../../core/api/api_result.dart';

class ComplaintsManagementUseCases{
  ComplaintsManagementRepo complaintsManagementRepo;
  ComplaintsManagementUseCases({required this.complaintsManagementRepo});
  Future<ApiResult<ComplaintsManagementResponse>> call() => complaintsManagementRepo.complaintsManagement();
}