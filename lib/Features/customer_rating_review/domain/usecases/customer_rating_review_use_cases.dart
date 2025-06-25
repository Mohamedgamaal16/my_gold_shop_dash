
import 'package:my_gold_dashboard/Features/customer_management/data/model/CustomerManagementResponse.dart';
import 'package:my_gold_dashboard/Features/customer_management/domain/repo/customer_management_impl.dart';
import 'package:my_gold_dashboard/Features/customer_rating_review/data/data_sorce/customer_rating_review_data_source.dart';
import 'package:my_gold_dashboard/Features/customer_rating_review/domain/repo/customer_rating_review_repo.dart';

import '../../../../core/api/api_result.dart';
import '../../data/model/CustomerRatingReviewRespone.dart';

class CustomerRatingReviewUseCases{
  CustomerRatingReviewRepo customerRatingReviewRepo;
  CustomerRatingReviewUseCases({required this.customerRatingReviewRepo});
  Future<ApiResult<CustomerRatingReviewRespone>> call() => customerRatingReviewRepo.customerRatingReview();
}