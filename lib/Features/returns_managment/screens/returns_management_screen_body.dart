import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/returns_managment/widgets/return_header.dart';
import 'package:my_gold_dashboard/Features/returns_managment/widgets/returns_table.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class ReturnsManagementScreenBody extends StatelessWidget {
  const ReturnsManagementScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [

                  Text("Returns Management", style: AppTextStyles.heading4(context).copyWith(fontWeight: FontWeight.bold)),

        ReturnHeader(selectedStatus: 'Pending', onStatusChanged: (String? value) {  },),

        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.85,
          child: ReturnsTable())
      ],
    );
  }
}