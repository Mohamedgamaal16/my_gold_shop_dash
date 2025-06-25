import 'package:my_gold_dashboard/Features/customer_rating_review/data/model/CustomerRatingReviewRespone.dart';

abstract class CustomerRatingReviewState{}


class CustomerRatingReviewInitState extends CustomerRatingReviewState{}
class CustomerRatingReviewLoadingState extends CustomerRatingReviewState{}
class CustomerRatingReviewErrorState extends CustomerRatingReviewState{
  String message;
  CustomerRatingReviewErrorState({required this.message});
}
class CustomerRatingReviewSuccessState extends CustomerRatingReviewState{
  CustomerRatingReviewRespone customerRatingReviewRespone;
  CustomerRatingReviewSuccessState({required this.customerRatingReviewRespone});
}