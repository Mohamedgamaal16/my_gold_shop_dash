
import 'package:dio/dio.dart';
import 'package:my_gold_dashboard/Features/complaints_management/data/model/ComplaintsManagementResponse.dart';
import 'package:my_gold_dashboard/core/api/api_manager.dart';

import 'package:my_gold_dashboard/core/api/api_result.dart';

import '../../../../core/error/Failures.dart';
import '../../presantation/widget/customer_rating_review_data_source.dart';
import '../model/CustomerRatingReviewRespone.dart';
import 'customer_rating_review_data_source.dart';

class CustomerRatingReviewDataSourceImpl implements CustomerRatingReviewDataSource{
  ApiManager apiManager;
  CustomerRatingReviewDataSourceImpl({required this.apiManager});
  @override
  Future<ApiResult<CustomerRatingReviewRespone>> customerRatingReview()async {
    try{
      var response  = await apiManager.customerRatingReview();
      return response;
    }on DioException catch (e) {
      return ApiErrorResult(
          failures: NetworkFailure(e.message ?? 'An unexpected error occurred')
      );
    } catch (e) {
      return ApiErrorResult(failures: NetworkFailure('Unexpected error: ${e.toString()}'));
    }
  }
}