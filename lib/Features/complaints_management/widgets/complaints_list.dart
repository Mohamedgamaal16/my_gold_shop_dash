import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/complaints_management/model/compaints_model.dart';
import 'package:my_gold_dashboard/Features/complaints_management/widgets/complaints_card.dart';
import 'package:my_gold_dashboard/Features/complaints_management/widgets/dashboard_header.dart';
import 'package:my_gold_dashboard/core/shared_widget/empty_screen.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';



class ComplaintsDashboard extends StatelessWidget {
  const ComplaintsDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    void handleComplaintTap(Complaint complaint) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Opened complaint ${complaint.formattedId}'),
          duration: const Duration(seconds: 2),
        ),
      );
    }

 List<Complaint> complaints =  [
    Complaint(
      id: 'C130',
      customerName: 'Richard Wilson',
      type: 'App Technical Issue',
      description: 'I\'m facing a technical issue while using the app...',
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
    ),
    Complaint(
      id: 'C129',
      customerName: 'Jessica Martinez',
      type: 'App Technical Issue',
      description: 'I\'m facing a technical issue while using the app...',
           timestamp: DateTime.now().subtract(const Duration(minutes: 1)),

    ),
    Complaint(
      id: 'C128',
      customerName: 'Thomas Anderson',
      type: 'App Technical Issue',
      description: 'I\'m facing a technical issue while using the app...',
           timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
),
    Complaint(
      id: 'C127',
      customerName: 'Richard Wilson',
      type: 'App Technical Issue',
      description: 'I\'m facing a technical issue while using the app...',
           timestamp: DateTime.now().subtract(const Duration(minutes: 1)),

    ),
    Complaint(
      id: 'C126',
      customerName: 'Thomas Anderson',
      type: 'App Technical Issue',
      description: 'I\'m facing a technical issue while using the app...',
            timestamp: DateTime.now().subtract(const Duration(minutes: 1)),

    ),
    Complaint(
      id: 'C125',
      customerName: 'Thomas Anderson',
      type: 'App Technical Issue',
      description: 'I\'m facing a technical issue while using the app...',
           timestamp: DateTime.now().subtract(const Duration(minutes: 1)),

    ),
  ];
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
                  onComplaintTap: handleComplaintTap,
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ComplaintsListView extends StatelessWidget {
  final List<Complaint> complaints;
  final Function(Complaint) onComplaintTap;

  const ComplaintsListView({
    super.key,
    required this.complaints,
    required this.onComplaintTap,
  });

  @override
  Widget build(BuildContext context) {
    if (complaints.isEmpty) {
      return const EmptyWidget();
    }

    return ListView.builder(
      itemCount: complaints.length,
      itemBuilder: (context, index) {
        final complaint = complaints[index];
        return ComplaintCard(
          complaint: complaint,
          onTap: () => onComplaintTap(complaint),
        );
      },
    );
  }
}

