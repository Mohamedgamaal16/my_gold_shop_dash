// customer_management_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_gold_dashboard/Features/customer_management/presentation/cubit/customer_management_cubit.dart';
import 'package:my_gold_dashboard/Features/customer_management/presentation/cubit/customer_management_state.dart';
import 'package:my_gold_dashboard/Features/customer_managemen_details/presentation/customer_management_details.dart';
import 'package:my_gold_dashboard/Features/customer_management/presentation/screen/widget/dynamic_orders_table.dart';
import 'package:my_gold_dashboard/Features/payment_management/presantation/screen/widget/custom_search_field.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class CustomerManagementBody extends StatefulWidget {
  const CustomerManagementBody({super.key});

  @override
  State<CustomerManagementBody> createState() =>
      _CustomerManagementBodyState();
}

class _CustomerManagementBodyState extends State<CustomerManagementBody> {
  List<Map<String, dynamic>> _rows = [];
  List<Map<String, dynamic>> _filtered = [];

  @override
  void initState() {
    super.initState();
    context.read<CustomerManagementCubit>().customerManagement();
  }

  void _search(String query) {
    final q = query.toLowerCase();
    setState(() {
      _filtered = _rows.where((row) {
        final name = row['Customer Name'].toString().toLowerCase();
        final id = row['Customer ID'].toString().toLowerCase();
        return name.contains(q) || id.contains(q);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerManagementCubit, CustomerManagementState>(
      builder: (context, state) {
        if (state is CustomerManagementLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CustomerManagementSuccessState) {
          _rows = state.customerManagementResponse.users!.map((u) {
            return {
              '_id': u.id,
              'Customer ID': 'CUST-${u.code}',
              'Customer Name': u.name,
              'Complaints': u.complaintsCount,
              'Refunds': u.refundOrdersCount,
              'Order History': 'VIEW',
            };
          }).toList();
          _filtered = _filtered.isEmpty ? List.from(_rows) : _filtered;
        }

        if (state is CustomerManagementErrorState) {
          return Center(child: Text(state.message));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: Text(
                  'Customer Management',
                  style: AppTextStyles.heading5(context),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CustomSearchField(
                  onSearch: _search,
                  hintText: 'Search by Customer Name or ID',
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DynamicOrdersTable(
                  rowData: _filtered,
                  columnNames: const [
                    'Customer ID',
                    'Customer Name',
                    'Complaints',
                    'Refunds',
                    'Order History'
                  ],
                  onViewPressed: (row) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CustomerManagementDetails(
                          customerId:row['_id'] ,
                      //    userId: ,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
