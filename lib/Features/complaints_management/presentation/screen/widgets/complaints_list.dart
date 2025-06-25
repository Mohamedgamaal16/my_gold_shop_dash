import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/shared_widget/empty_screen.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';

import '../../../data/model/Complain.dart';
import 'complaints_card.dart';
import 'dashboard_header.dart';

class ComplaintsDashboard extends StatelessWidget {
  final List<Complain> complaints;

  const ComplaintsDashboard({super.key, required this.complaints});

  @override
  Widget build(BuildContext context) {
    void handleTap(Complain c) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Opened complaint ${c.complainCode}'),
          duration: const Duration(seconds: 2),
        ),
      );
    }

    return Container(
      color: const Color(0xFFF8F9FA),
      child: Column(
        children: [
          DashboardHeader(totalComplaints: complaints.length),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(10),
              color: AppColors.colorsBackground,
              child: ComplaintsListView(
                complaints: complaints,
                onComplaintTap: handleTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ComplaintsListView extends StatelessWidget {
  final List<Complain> complaints;
  final void Function(Complain) onComplaintTap;

  const ComplaintsListView({
    super.key,
    required this.complaints,
    required this.onComplaintTap,
  });

  @override
  Widget build(BuildContext context) {
    if (complaints.isEmpty) {
      return const EmptyWidget(title: 'لا يوجد شكاوي الان', subtitle: '');
    }

    return ListView.builder(
      itemCount: complaints.length,
      itemBuilder: (_, i) {
        final c = complaints[i];
        return ComplaintCard(
          complain: c,
          onTap: () => onComplaintTap(c),
        );
      },
    );
  }
}
