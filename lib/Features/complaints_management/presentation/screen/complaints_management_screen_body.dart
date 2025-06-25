import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gold_dashboard/Features/complaints_management/presentation/cubit/complaints_management_cubit.dart';
import 'package:my_gold_dashboard/Features/complaints_management/presentation/cubit/complaints_management_state.dart';
import 'package:my_gold_dashboard/Features/complaints_management/presentation/screen/widgets/complaints_header.dart';
import 'package:my_gold_dashboard/Features/complaints_management/presentation/screen/widgets/complaints_list.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';

import '../../data/model/Complain.dart';

class ComplaintsManagementScreenBody extends StatefulWidget {
  const ComplaintsManagementScreenBody({super.key});

  @override
  State<ComplaintsManagementScreenBody> createState() =>
      _ComplaintsManagementScreenBodyState();
}

class _ComplaintsManagementScreenBodyState
    extends State<ComplaintsManagementScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<ComplaintsManagementCubit>().complaintsManagement();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ComplaintsHeader(
          selectedStatus: 'Pending',
          onStatusChanged: (_) {},
        ),
        const SizedBox(height: 12),
        Expanded(
          child: BlocBuilder<ComplaintsManagementCubit,
              ComplaintsManagementState>(
            builder: (_, state) {
              if (state is ComplaintsManagementLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ComplaintsManagementErrorState) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: AppColors.trafficLightColorsError),
                  ),
                );
              }

              if (state is ComplaintsManagementSuccessState) {
                final List<Complain> items =
                    state.complaintsManagementResponse.complain ?? [];
                return ComplaintsDashboard(complaints: items);
              }

              // initial / fallback
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
