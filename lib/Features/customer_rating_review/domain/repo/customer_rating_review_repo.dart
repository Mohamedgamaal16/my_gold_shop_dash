import '../../../../core/api/api_result.dart';
import '../../data/model/CustomerRatingReviewRespone.dart';

abstract class CustomerRatingReviewRepo{
  Future<ApiResult<CustomerRatingReviewRespone>> customerRatingReview();
}