import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gold_dashboard/Features/returns_managment/presentation/cubit/return_management_cubit.dart';
import 'returns_management_screen_body.dart';

class ReturnsManagementScreen extends StatelessWidget {
  const ReturnsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReturnManagementCubit()..returnManagement(),
      child: const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: ReturnsManagementScreenBody(),
        ),
      ),
    );
  }
}
