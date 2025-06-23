import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/styles/colors.dart';
import '../../settings/widget/setting_appbar.dart';
import 'cubit/customer_management_cubit.dart';
import 'customer_management_details_body.dart';

class CustomerManagementDetails extends StatelessWidget {
  final String customerId;
  const CustomerManagementDetails({super.key  , required this.customerId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerManagementDetailsCubit(),
      child: Scaffold(
        backgroundColor: AppColors.colorsBackground,
        appBar: buildAppBar(),
        body: CustomerManagementDetailsBody(customerId: customerId,),
      ),
    );
  }
}
