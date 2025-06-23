import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../model/ReturnManagementResponse.dart';

abstract class ReturnManagementDataSource{
  Future<ApiResult<ReturnManagementResponse>> returnManagement();
}