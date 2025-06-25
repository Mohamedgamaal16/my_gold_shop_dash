// returns_management_screen_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_gold_dashboard/Features/returns_managment/data/model/ReturnData.dart';
import 'package:my_gold_dashboard/Features/returns_managment/presentation/cubit/return_management_cubit.dart';
import 'package:my_gold_dashboard/Features/returns_managment/presentation/cubit/return_management_state.dart';
import 'package:my_gold_dashboard/Features/returns_managment/presentation/screens/widgets/returns_table.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';
import '../../../payment_management/presantation/screen/widget/search_dropdown_filter.dart';

class ReturnsManagementScreenBody extends StatefulWidget {
  const ReturnsManagementScreenBody({super.key});

  @override
  State<ReturnsManagementScreenBody> createState() =>
      _ReturnsManagementScreenBodyState();
}

class _ReturnsManagementScreenBodyState
    extends State<ReturnsManagementScreenBody> {
  String _search = '';
  String _filter = 'Status';
  final _filters = ['Status', 'pending', 'approved', 'rejected'];

  @override
  void initState() {
    super.initState();
    context.read<ReturnManagementCubit>().returnManagement();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnManagementCubit, ReturnManagementState>(
      builder: (context, state) {
        List<ReturnData> rows = [];

        if (state is ReturnManagementSuccessState) {
          rows = state.returnManagementResponse.returnData ?? [];
        }

        // filter by status
        if (_filter != 'Status') {
          rows = rows.where(
                  (r) => (r.status ?? '').toLowerCase() == _filter).toList();
        }
        // local search
        if (_search.isNotEmpty) {
          final q = _search.toLowerCase();
          rows = rows.where((r) {
            final orderId = 'ORD-${r.orderCode}'.toLowerCase();
            final name    = (r.name ?? '').toLowerCase();
            return orderId.contains(q) || name.contains(q);
          }).toList();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Returns Management',
              style: AppTextStyles.heading4(context)
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SearchDropdownFilter(
                searchHintText: 'Search by Order ID or Customer Name',
                dropdownItems: _filters,
                selectedItem: _filter,
                onDropdownChanged: (v) =>
                    setState(() => _filter = v ?? 'Status'),
                onSearch: (q) => setState(() => _search = q),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: state is ReturnManagementLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : state is ReturnManagementErrorState
                  ? Center(child: Text(state.message))
                  : ReturnsTable(rows: rows),
            ),
          ],
        );
      },
    );
  }
}
