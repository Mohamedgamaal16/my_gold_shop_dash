import '../../../../core/api/api_result.dart';
import '../model/ComplaintsManagementResponse.dart';

abstract class  ComplaintsManagementDataSource{
  Future<ApiResult<ComplaintsManagementResponse>> complaintsManagement();
}