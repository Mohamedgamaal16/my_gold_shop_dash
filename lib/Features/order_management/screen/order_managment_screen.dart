import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/order_management/screen/order_managment_screen_body.dart';
import 'package:my_gold_dashboard/Features/settings/widget/setting_appbar.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';

class OrderManagmentScreen extends StatelessWidget {
  const OrderManagmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  backgroundColor: AppColors.colorsBackground,
        appBar: buildAppBar(),
      body: Padding(
      padding: const EdgeInsets.all(16),
        child: OrderManagmentScreenBody(),
      ),
    );
  }
}