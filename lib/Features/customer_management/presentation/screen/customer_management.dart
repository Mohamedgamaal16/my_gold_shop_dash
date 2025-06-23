import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/colors.dart';
import '../../../settings/widget/setting_appbar.dart';
import '../cubit/customer_management_cubit.dart';
import 'customer_management_body.dart';

class CustomerManagement extends StatelessWidget {
  const CustomerManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CustomerManagementCubit(),
      child: Scaffold(
        backgroundColor: AppColors.colorsBackground,
        appBar: buildAppBar(),
        body: CustomerManagementBody(),
      ),
    );
  }
}
