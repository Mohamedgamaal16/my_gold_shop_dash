import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/home/widgets/activity_panel.dart';
import 'package:my_gold_dashboard/Features/home/widgets/alert_panel.dart';
import 'package:my_gold_dashboard/Features/home/widgets/gold_price_header.dart';
import 'package:my_gold_dashboard/Features/home/widgets/payment_pie_chart.dart';
import 'package:my_gold_dashboard/Features/home/widgets/sales_bar_chart.dart';
import 'package:my_gold_dashboard/Features/home/widgets/state_card.dart';
import 'package:my_gold_dashboard/Features/home/widgets/top_perfomer_pandel.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          GoldPriceHeader(),
          const SizedBox(height: 20),

          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 15,
            runSpacing: 15,
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              StatCard(
                title: "Total Orders",
                value: "1,245",
                icon: Icons.shopping_cart,
                percentageChange: "+12% vs last month",
                changeColor: Colors.green,
              ),
              StatCard(
                title: "Total Revenue",
                value: "5,230,000 SAR",
                icon: Icons.attach_money,
                percentageChange: "+8% vs last month",
                changeColor: Colors.green,
              ),
              StatCard(
                title: "Active Deliveries",
                value: "32",
                icon: Icons.local_shipping,
                percentageChange: "-3% vs last month",
                changeColor: Colors.red,
              ),
              StatCard(
                title: "Total Customers",
                value: "876",
                icon: Icons.people,
                percentageChange: "+5% vs last month",
                changeColor: Colors.green,
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.6,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: SalesBarChart()),
                const SizedBox(width: 16),
                Expanded(child: PaymentPieChart()),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.6,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: RecentActivitiesPanel()),
                const SizedBox(width: 16),
                Expanded(child: SystemAlertsPanel()),
              ],
            ),
          ),
          const SizedBox(height: 20),
          TopPerformersPanel(),
        ],
      ),
    );
  }
}
