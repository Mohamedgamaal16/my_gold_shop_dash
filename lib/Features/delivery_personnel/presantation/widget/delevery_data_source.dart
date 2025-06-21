import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/delivery_personnel/presantation/model/agent_model.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';

class DeleveryDataSource extends DataTableSource {
  DeleveryDataSource(
    this.context,
    this.agents, {
    this.onSuspend,
    this.onBlock,
    this.onTrackLocation,
  });

  final BuildContext context;
  final List<AgentModel> agents;
  final void Function(AgentModel agent)? onSuspend;
  final void Function(AgentModel agent)? onBlock;
  final void Function(AgentModel agent)? onTrackLocation;

  @override
  DataRow? getRow(int index) {
    final agent = agents[index];
    return DataRow(
      cells: [
        // Agent Name and ID
        DataCell(
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.greyScaleCharcoalGrey,
                child: Icon(
                  Icons.person,
                  color: AppColors.colorsSurface,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    agent.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'ID: ${agent.id}',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.greyScaleCharcoalGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        // Status
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _getStatusColor(agent.status),
              borderRadius: BorderRadius.circular(0),
            ),
            child: Text(
              agent.status,
              style: TextStyle(
                color: _getStatusTextColor(agent.status),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        
        // Location
        DataCell(
          agent.location == "Not available"
              ? Text(
                  agent.location,
                  style: TextStyle(
                    color: AppColors.greyScaleCharcoalGrey,
                    fontSize: 14,
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    if (onTrackLocation != null) {
                      onTrackLocation!(agent);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.colorsPrimary2,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.colorsSurface,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Track Location",
                          style: TextStyle(
                            color: AppColors.colorsSurface,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
        
        // Assigned Point
        DataCell(
          Container(
            constraints: const BoxConstraints(maxWidth: 200),
            child: Text(
              agent.assignedPoint,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),
        
        // Actions
        DataCell(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Suspend Button
              GestureDetector(
                onTap: () {
                  if (onSuspend != null) {
                    onSuspend!(agent);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.pause_circle_outline,
                        color: Colors.orange,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Suspend",
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              
              // Block Button
              GestureDetector(
                onTap: () {
                  if (onBlock != null) {
                    onBlock!(agent);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.trafficLightColorsError.withOpacity(0.1),
                    border: Border.all(color: AppColors.trafficLightColorsError),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.block,
                        color: AppColors.trafficLightColorsError,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Block",
                        style: TextStyle(
                          color: AppColors.trafficLightColorsError,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return AppColors.trafficLightColorsSuccess.withOpacity(0.15);
      case 'inactive':
        return Colors.orange.shade50;
      case 'suspended':
        return AppColors.greyScaleNearWhite;
      default:
        return AppColors.greyScaleNearWhite;
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return AppColors.trafficLightColorsSuccess;
      case 'inactive':
        return Colors.orange;
      case 'suspended':
        return AppColors.greyScaleCharcoalGrey;
      default:
        return AppColors.greyScaleCharcoalGrey;
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => agents.length;

  @override
  int get selectedRowCount => 0;
}
