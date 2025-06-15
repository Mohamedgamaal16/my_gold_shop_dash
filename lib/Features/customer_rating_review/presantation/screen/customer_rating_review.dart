import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../settings/widget/setting_appbar.dart';
import 'customer_rating_review_body.dart';

class CustomerRatingReview extends StatelessWidget {
  const CustomerRatingReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorsBackground,
      appBar: buildAppBar(),
      body: CustomerRatingReviewBody(),
    );
  }
}
