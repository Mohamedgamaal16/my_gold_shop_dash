import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/complaints_management/widgets/complaints_header.dart';
import 'package:my_gold_dashboard/Features/complaints_management/widgets/complaints_list.dart';

class ComplaintsManagementScreenBody extends StatelessWidget {
  const ComplaintsManagementScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ComplaintsHeader(selectedStatus: 'Pending', onStatusChanged: (String? value) {  },),

        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.85,
          child: ComplaintsDashboard())
      ],
    );
  }
}