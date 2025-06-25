import '../../../../core/api/api_result.dart';
import '../../data/model/ComplaintsManagementResponse.dart';

abstract class ComplaintsManagementRepo {
  Future<ApiResult<ComplaintsManagementResponse>> complaintsManagement();
}