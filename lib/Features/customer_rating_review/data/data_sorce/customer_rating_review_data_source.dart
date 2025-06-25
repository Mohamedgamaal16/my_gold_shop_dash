import 'package:my_gold_dashboard/Features/complaints_management/data/model/ComplaintsManagementResponse.dart';
import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../model/CustomerRatingReviewRespone.dart';

abstract class CustomerRatingReviewDataSource{
  Future<ApiResult<CustomerRatingReviewRespone>> customerRatingReview();
}