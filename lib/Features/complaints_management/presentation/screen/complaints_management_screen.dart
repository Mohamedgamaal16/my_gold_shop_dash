import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gold_dashboard/Features/complaints_management/presentation/cubit/complaints_management_cubit.dart';
import 'complaints_management_screen_body.dart';

class ComplaintsManagementScreen extends StatelessWidget {
  const ComplaintsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ComplaintsManagementCubit(),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: ComplaintsManagementScreenBody(),
      ),
    );
  }
}
