import 'package:my_gold_dashboard/Features/customer_rating_review/data/data_sorce/customer_rating_review_data_source.dart';
import 'package:my_gold_dashboard/Features/customer_rating_review/data/model/CustomerRatingReviewRespone.dart';

import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../../domain/repo/customer_rating_review_repo.dart';

class CustomerRatingReviewRepoImpl implements CustomerRatingReviewRepo{
  CustomerRatingReviewDataSource customerRatingReviewDataSource;
  CustomerRatingReviewRepoImpl({required this.customerRatingReviewDataSource});

  @override
  Future<ApiResult<CustomerRatingReviewRespone>> customerRatingReview()async {
    var response  =await customerRatingReviewDataSource.customerRatingReview();
    return response;
  }
}