import '../../../../core/api/api_result.dart';
import '../../data/model/ReturnManagementResponse.dart';

abstract class ReturnManagementRepo{
  Future<ApiResult<ReturnManagementResponse>> returnManagement();
}