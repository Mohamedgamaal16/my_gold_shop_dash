import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/home/screens/home_screen_body.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
            padding: EdgeInsets.all(16),

      child: HomeScreenBody(),);
  }
}