import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/settings/model/admin_model.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class PermissionBadge extends StatelessWidget {
  final PermissionLevel permission;

  const PermissionBadge({super.key, required this.permission});

  String getPermissionText() {
    switch (permission) {
      case PermissionLevel.orderManagement:
        return 'Order Management';
      case PermissionLevel.customerManagement:
        return 'Customer Management';
      case PermissionLevel.merchantManagement:
        return 'Merchant Management';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(color: AppColors.texturesGoldTexture2),
      child: Center(
        child: Text(getPermissionText(), style: AppTextStyles.bodyS(context)),
      ),
    );
  }
}
