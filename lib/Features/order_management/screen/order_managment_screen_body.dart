import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/order_management/widgets/order_filter_bar.dart';
import 'package:my_gold_dashboard/Features/order_management/widgets/orders_table.dart';
import 'package:my_gold_dashboard/core/shared_widget/custom_button.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class OrderManagmentScreenBody extends StatelessWidget {
  const OrderManagmentScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Row(
            children: [
              Text("Order Management", style: AppTextStyles.heading3(context)),
      
              
              Spacer(),
              CustomButton(
                onPressed: () {},
                labelName: "Old Order",
                isPrimary: false,
                height: 50,
                width: MediaQuery.sizeOf(context).width * 0.1,
              ),
              SizedBox(width: 16),
              CustomButton(
                onPressed: () {},
                height: 50,
                labelName: "Active Order",
                width: MediaQuery.sizeOf(context).width * 0.1,
              ),
            ],
          ),
      
          OrdersFilterBar(selectedStatus: 'Pending', onStatusChanged: (String? value) {  }, onFilterPressed: () {  },),
      
                      Text("New Order", style: AppTextStyles.heading4(context)),
      
      
         OrdersTable()
        ],
      ),
    );
  }
}
