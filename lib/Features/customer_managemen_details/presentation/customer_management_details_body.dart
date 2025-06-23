import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_gold_dashboard/Features/customer_managemen_details/presentation/cubit/customer_management_state.dart';
import 'package:my_gold_dashboard/Features/customer_managemen_details/presentation/widget/customer_order_card.dart';
import 'package:my_gold_dashboard/Features/payment_management/presantation/screen/widget/custom_search_field.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

import '../../../core/shared_widget/error_state_view.dart';
import 'cubit/customer_management_cubit.dart';

class CustomerManagementDetailsBody extends StatefulWidget {
  const CustomerManagementDetailsBody({super.key, required this.customerId});
  final String customerId;

  @override
  State<CustomerManagementDetailsBody> createState() =>
      _CustomerManagementDetailsBodyState();
}

class _CustomerManagementDetailsBodyState
    extends State<CustomerManagementDetailsBody> {
  List<Map<String, dynamic>> _rows = [];
  List<Map<String, dynamic>> _filtered = [];

  @override
  void initState() {
    super.initState();
    context
        .read<CustomerManagementDetailsCubit>()
        .customerManagementDetails(widget.customerId);
  }

  void _search(String q) {
    final query = q.toLowerCase();
    setState(() {
      _filtered = _rows
          .where((e) => e['Order ID'].toString().toLowerCase().contains(query))
          .toList();
    });
  }

  Widget _noOrdersUI(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.inventory_2_rounded,
            size: 80, color: Colors.grey.shade400),
        const SizedBox(height: 12),
        Text('No orders found',
            style: AppTextStyles.heading6(context)
                .copyWith(color: Colors.grey.shade600)),
        const SizedBox(height: 4),
        Text('This customer has no orders yet.',
            style: AppTextStyles.bodyS(context)
                .copyWith(color: Colors.grey.shade500)),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerManagementDetailsCubit,
        CustomerManagementDetailsState>(
      builder: (context, state) {
        if (state is CustomerManagementDetailsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CustomerManagementDetailsErrorState) {
          return ErrorStateView(
            errorMessage:
            'Please check your internet connection and try again.',
            onRetry: () => context
                .read<CustomerManagementDetailsCubit>()
                .customerManagementDetails(widget.customerId),
          );
        }


        if (state is CustomerManagementDetailsSuccessState) {
          final data = state.customerManagementDetailsResponse.data;


          if (data == null || data.orders == null || data.orders!.isEmpty) {
            return _noOrdersUI(context);
          }
          _rows = data.orders!.map((order) {
            final firstItem = order.items?.isNotEmpty == true
                ? order.items!.first
                : null;
            final images = order.items
                ?.where((i) => i.productImage != null)
                .map((i) =>
            'https://mygold.uber.space${i.productImage}')
                .toList() ??
                [];
            return {
              '_id': order.id,
              'Customer Name': order.user?.name ?? '',
              'Customer ID': 'CUST-${data.userCode}',
              'Order ID': 'ORD-${order.orderCode ?? order.id}',
              'Received Date': order.createdAt != null
                  ? DateFormat('MMM dd, yyyy').format(order.createdAt!)
                  : '',
              'Payment Method': order.paymentMethod ?? '',
              'Delivery Name': order.driver?.name ?? '',
              'Merchant Name': order.merchant?.name ?? '',
              'Product': firstItem?.productName ?? '',
              'Images': images,
            };
          }).toList();
          _filtered = List.from(_rows);
        }

        if (_filtered.isEmpty) {
          return _noOrdersUI(context);
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            children: [
              Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CustomSearchField(
                  onSearch: _search,
                  hintText: 'Search for order id',
                ),
              ),
              const SizedBox(height: 10),
              ..._filtered.map(
                    (order) => Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8),
                  child: CustomerOrderCard(
                    customerName: order['Customer Name'],
                    customerId: order['Customer ID'],
                    orderId: order['Order ID'],
                    receivedDate: order['Received Date'],
                    paymentMethod: order['Payment Method'],
                    deliveryName: order['Delivery Name'],
                    merchantName: order['Merchant Name'],
                    product: order['Product'],
                    imageUrls: List<String>.from(order['Images']),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
