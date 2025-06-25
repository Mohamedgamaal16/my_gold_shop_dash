import 'Reviews.dart';

class CustomerRatingReviewRespone {
  CustomerRatingReviewRespone({
      this.reviews,});

  CustomerRatingReviewRespone.fromJson(dynamic json) {
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add(Reviews.fromJson(v));
      });
    }
  }
  List<Reviews>? reviews;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (reviews != null) {
      map['reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}