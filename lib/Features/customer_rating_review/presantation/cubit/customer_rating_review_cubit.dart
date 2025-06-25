import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gold_dashboard/Features/customer_rating_review/data/data_sorce/customer_rating_review_data_sorce_impl.dart';
import 'package:my_gold_dashboard/Features/customer_rating_review/data/model/CustomerRatingReviewRespone.dart';
import 'package:my_gold_dashboard/Features/customer_rating_review/data/repo_impl/customer_rating_review_repo_impl.dart';
import 'package:my_gold_dashboard/Features/customer_rating_review/domain/usecases/customer_rating_review_use_cases.dart';
import 'package:my_gold_dashboard/core/api/api_manager.dart';
import 'package:my_gold_dashboard/core/api/api_result.dart';

import 'customer_rating_review_state.dart';

class CustomerRatingReviewCubit extends Cubit<CustomerRatingReviewState>{
  CustomerRatingReviewCubit() : super(CustomerRatingReviewInitState());



  CustomerRatingReviewUseCases customerRatingReviewUseCases =CustomerRatingReviewUseCases(customerRatingReviewRepo: CustomerRatingReviewRepoImpl(customerRatingReviewDataSource: CustomerRatingReviewDataSourceImpl(apiManager: ApiManager())));

  customerRatingReview()async{
    emit(CustomerRatingReviewLoadingState());


    var response = await customerRatingReviewUseCases.call();

    switch(response) {
      case ApiSuccessResult<CustomerRatingReviewRespone>():
        emit(CustomerRatingReviewSuccessState(customerRatingReviewRespone: response.data));
      case ApiErrorResult<CustomerRatingReviewRespone>():
        emit(CustomerRatingReviewErrorState(message: response.failures.message));
    }
  }
}