import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:my_gold_dashboard/core/styles/colors.dart';
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.height = 50});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFoldingCube(
        color: AppColors.colorsPrimary2,
        size: height,
      ),
    );
  }
}
